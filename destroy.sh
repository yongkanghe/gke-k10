starttime=$(date +%s)
. setenv.sh
echo '-------Deleting the GKE Cluster (typically in less than 10 mins)'
MY_PREFIX=$(echo $(whoami) | sed -e 's/\_//g' | sed -e 's/\.//g' | awk '{print tolower($0)}')
gkeclustername=$(gcloud container clusters list | grep $MY_PREFIX-$MY_CLUSTER | awk '{print $1}')
gcloud container clusters delete $gkeclustername --zone $MY_ZONE --quiet

echo '-------Deleting disks'
for i in $(gcloud compute disks list --filter="zone:($MY_ZONE)" | grep $MY_PREFIX-$MY_CLUSTER | awk '{print $1}');do echo $i;gcloud compute disks delete $i --zone=$MY_ZONE -q;done

echo '-------Deleting snapshots'
for i in $(gcloud compute snapshots list | grep $MY_PREFIX-$MY_CLUSTER | awk '{print $1}');do echo $i;gcloud compute snapshots delete $i -q;done

echo '-------Deleting the bucket'
myproject=$(gcloud config get-value core/project)
gsutil rm -r gs://$MY_PREFIX-$MY_BUCKET

echo '-------Deleting kubeconfig for this cluster'
kubectl config delete-context $(kubectl config get-contexts | grep $MY_PREFIX-$MY_CLUSTER | awk '{print $2}')

endtime=$(date +%s)
duration=$(( $endtime - $starttime ))
echo "-------Total time is $(($duration / 60)) minutes $(($duration % 60)) seconds."
