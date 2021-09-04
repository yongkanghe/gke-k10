It is challenging to create a GKE cluster from Google Cloud if you are not familiar to it. After the GKE Cluster is up running, we still need to install Kasten, create a sample DB, create policies etc.. The whole process is not that simple.

This script based automation allows you to build a ready-to-use Kasten K10 demo environment running on GKE in about 6 minutes. Below tasks will be automatically completed within 10 minutes. For simplicity and cost optimization, the GKE cluster will have only one worker node and be built in the default vpc using the default subnet. 

# Here're the prerequisities.
1. Install Cloud SDK https://cloud.google.com/sdk/docs/install#linux
2. Initialize glcoud, run below command
````
glcoud init
````
3. Install git if not installed, https://www.linode.com/docs/guides/how-to-install-git-on-linux-mac-and-windows/
4. Clone the github repo to your local host, run below command
````
git clone https://github.com/yongkanghe/gke-k10.git
````
5. Create gcloud service account first
````
createsa.sh
````
6. Optionally, you may update the preferred clustername, machine-type, zone, region, bucketname
````
vi setenv.sh
````
 
# To build the labs, run 
````
deploy.sh
````
1. Create a GKE Cluster from CLI
2. Install Kasten K10
3. Create a location profile
4. Deploy a Postgres database
5. Create a backup policy
6. Kick off an on-demand backup job

# To delete the labs, run 
````
destroy.sh
````
1. Remove GKE Kubernetes Cluster
2. Remove all the relevant disks
3. Remove all the relevant snapshots
4. Remove all the objects from the bucket

# For more details about GKE Backup and Restore
https://blog.kasten.io/posts/postgresql-backup-and-restore-on-google-cloud-using-kasten-k10


# Kasten - No. 1 Kubernetes Backup
https://kasten.io 

# Kasten selected as the best DevOps tool in July 2021
https://www.linkedin.com/posts/yongkanghe_kubernetes-backup-restore-made-easy-activity-6822488395001008128-RDG_
