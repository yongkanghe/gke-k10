echo '-------Deploy Kasten K10 and Postgresql in 3 mins'
starttime=$(date +%s)
. ./setenv.sh
TEMP_PREFIX=$(echo $(whoami) | sed -e 's/\_//g' | sed -e 's/\.//g' | awk '{print tolower($0)}')
FIRST2=$(echo -n $TEMP_PREFIX | head -c2)
LAST2=$(echo -n $TEMP_PREFIX | tail -c2)
MY_PREFIX=$(echo $FIRST2$LAST2)

echo '-------Install K10'
sa_key=$(base64 -w0 k10-sa-key.json)
kubectl create ns kasten-io
helm repo add kasten https://charts.kasten.io/
helm repo update

echo '-------Set the default sc & vsc'
kubectl annotate sc standard storageclass.kubernetes.io/is-default-class-
kubectl annotate sc standard-rwo storageclass.kubernetes.io/is-default-class=true --overwrite

#For Production, remove the lines ending with =1Gi from helm install
#For Production, remove the lines ending with airgap from helm install
helm install k10 kasten/k10 --version=5.0.6 --namespace=kasten-io \
  --set global.persistence.metering.size=1Gi \
  --set prometheus.server.persistentVolume.size=1Gi \
  --set global.persistence.catalog.size=1Gi \
  --set global.persistence.jobs.size=1Gi \
  --set global.persistence.logging.size=1Gi \
  --set global.persistence.grafana.size=1Gi \
  --set secrets.googleApiKey=$sa_key \
  --set auth.tokenAuth.enabled=true \
  --set externalGateway.create=true \
  --set metering.mode=airgap

echo '-------Set the default ns to k10'
kubectl config set-context --current --namespace kasten-io

echo '-------Creating a gke pd vsc'
cat <<EOF | kubectl apply -f -
apiVersion: snapshot.storage.k8s.io/v1
kind: VolumeSnapshotClass
metadata:
  annotations:
    k10.kasten.io/is-snapshot-class: "true"
  name: gke-pd-vsc
driver: pd.csi.storage.gke.io
deletionPolicy: Delete
EOF

echo '-------Deploying a PostgreSQL database'
kubectl create namespace yong-postgresql
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install --namespace yong-postgresql postgres bitnami/postgresql --set primary.persistence.size=1Gi

echo '-------Output the Cluster ID'
clusterid=$(kubectl get namespace default -ojsonpath="{.metadata.uid}{'\n'}")
echo "" | awk '{print $1}' > gke_token
echo My Cluster ID is $clusterid >> gke_token

echo '-------Wait for 1 or 2 mins for the Web UI IP and token'
kubectl wait --for=condition=ready --timeout=180s -n kasten-io pod -l component=jobs
# k10ui=http://$(kubectl get svc gateway-ext | awk '{print $4}' -n kasten-io | grep -v EXTERNAL)/k10/#
# echo -e "\nDouble Click to copy the token before clicking the link to log into K10 Web UI -->> $k10ui" >> gke_token
echo "" | awk '{print $1}' >> gke_token
sa_secret=$(kubectl get serviceaccount k10-k10 -o jsonpath="{.secrets[0].name}" --namespace kasten-io)
echo "Here is the token to login K10 Web UI" >> gke_token
echo "" | awk '{print $1}' >> gke_token
kubectl get secret $sa_secret --namespace kasten-io -ojsonpath="{.data.token}{'\n'}" | base64 --decode | awk '{print $1}' >> gke_token
echo "" | awk '{print $1}' >> gke_token

echo '-------Waiting for K10 services are up running in about 1 or 2 mins'
kubectl wait --for=condition=ready --timeout=300s -n kasten-io pod -l component=catalog

#Create a S3 location profile
./gcs-location.sh

#Create a Cassandra backup policy
./postgresql-policy.sh

echo '-------Accessing K10 UI'

k10ui=http://$(kubectl get svc gateway-ext -n kasten-io | awk '{print $4}' | grep -v EXTERNAL)/k10/#
echo -e "Copy the token before clicking the link to log into K10 Web UI -->> $k10ui" >> gke_token
cat gke_token
echo "" | awk '{print $1}'

endtime=$(date +%s)
duration=$(( $endtime - $starttime ))
echo "-------Total time for K10+DB+Policy deployment is $(($duration / 60)) minutes $(($duration % 60)) seconds."
echo "" | awk '{print $1}'
echo "-------Created by Yongkang"
echo "-------Email me if any suggestions or issues he@yongkang.cloud"
echo "" | awk '{print $1}'
