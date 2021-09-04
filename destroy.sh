startingtime="$(TZ=UTC0 printf '%(%s)T\n' '-1')"
. setenv.sh
echo '-------Deleting a GKE Cluster (typically in less than 10 mins)'
gcloud container clusters delete $MY_CLUSTER --zone $MY_ZONE --quiet

echo '-------Deleting disks'
for i in $(gcloud compute disks list --filter="zone:($MY_ZONE)" | grep $MY_CLUSTER | awk '{print $1}');do echo $i;gcloud compute disks delete $i --zone=$MY_ZONE -q;done

echo '-------Deleting snapshots'
for i in $(gcloud compute snapshots list | grep $MY_CLUSTER | awk '{print $1}');do echo $i;gcloud compute snapshots delete $i -q;done

echo '-------Deleting objects from the bucket'
myproject=$(gcloud config get-value core/project)
gsutil -m rm -r gs://$myproject-$MY_BUCKET/k10

duration=$(( $(TZ=UTC0 printf '%(%s)T\n' '-1') - startingtime ))
echo "-------Total time is $(($duration / 60)) minutes $(($duration % 60)) seconds."
