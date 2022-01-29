echo '-------Creating a GKE Cluster + K10 (typically about 6 mins)'
starttime=$(date +%s)

#Create an GKE cluster
./gke-deploy.sh

#Deploy K10 + sample DB + backup policy 
./k10-deploy.sh

endtime=$(date +%s)
duration=$(( $endtime - $starttime ))
echo "-------Total time for GKE+K10 deployment is $(($duration / 60)) minutes $(($duration % 60)) seconds."
echo "" | awk '{print $1}'

