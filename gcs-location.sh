. ./setenv.sh
TEMP_PREFIX=$(echo $(whoami) | sed -e 's/\_//g' | sed -e 's/\.//g' | awk '{print tolower($0)}')
FIRST2=$(echo -n $TEMP_PREFIX | head -c2)
LAST2=$(echo -n $TEMP_PREFIX | tail -c2)
MY_PREFIX=$(echo $FIRST2$LAST2)

echo '-------Creating a GCS profile secret'
myproject=$(gcloud config get-value core/project)
kubectl create secret generic k10-gcs-secret \
      --namespace kasten-io \
      --from-literal=project-id=$myproject \
      --from-file=service-account.json=k10-sa-key.json

echo '-------Creating a GCS profile'
cat <<EOF | kubectl apply -f -
apiVersion: config.kio.kasten.io/v1alpha1
kind: Profile
metadata:
  name: $MY_OBJECT_STORAGE_PROFILE
  namespace: kasten-io
spec:
  type: Location
  locationSpec:
    credential:
      secretType: GcpServiceAccountKey
      secret:
        apiVersion: v1
        kind: Secret
        name: k10-gcs-secret
        namespace: kasten-io
    type: ObjectStore
    objectStore:
      name: $MY_PREFIX-$MY_BUCKET
      objectStoreType: GCS
      region: $MY_REGION
EOF
