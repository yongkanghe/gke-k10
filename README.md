I just want to build a GKE Cluster to play with the various Data Management capabilities e.g. Backup/Restore, Disaster Recovery and Application Mobility. 

It is challenging to create a GKE cluster from Google Cloud if you are not familiar to it. After the GKE Cluster is up running, we still need to install Kasten, create a sample DB, create policies etc.. The whole process is not that simple.

![image](https://user-images.githubusercontent.com/40347406/132093566-f98f3d69-1b39-4153-9f98-e47bcd0346d3.png)

This script based automation allows you to build a ready-to-use Kasten K10 demo environment running on GKE in about 6 minutes. For simplicity and cost optimization, the GKE cluster will have only one worker node and be built in the default vpc using the default subnet. This is bash shell based scripts which has been tested on Cloud Shell. Linux or MacOS terminal has not been tested though it might work as well. 

# Here're the prerequisities. 
1. Go to open Google Cloud Shell
2. Clone the github repo to your local host, run below command
````
git clone https://github.com/yongkanghe/gke-k10.git
````
3. Create gcloud service account first
````
cd gke-k10;./createsa.sh
````
4. Optionally, you can customize the clustername, machine-type, zone, region, bucketname
````
vi setenv.sh
````
 
# To build the labs, run 
````
./deploy.sh
````
1. Create a GKE Cluster from CLI
2. Install Kasten K10
3. Deploy a Postgres database
4. Create a location profile
5. Create a backup policy

# To retrieve Kasten Console URL and Token
````
./get-k10url.sh
````

# To delete the labs, run 
````
./destroy.sh
````
1. Remove GKE Kubernetes Cluster
2. Remove all the relevant disks
3. Remove all the relevant snapshots
4. Remove the bucket

# Cick my picture to watch the how-to video.
[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/6vDEk_9cNaI/0.jpg)](https://www.youtube.com/watch?v=6vDEk_9cNaI)

# For more details about GKE Backup and Restore
https://blog.kasten.io/posts/postgresql-backup-and-restore-on-google-cloud-using-kasten-k10


# Kasten - No. 1 Kubernetes Backup
https://kasten.io 

# Kasten - DevOps tool of the month July 2021
http://k10.yongkang.cloud

# Contributors

### [Yongkang He](http://yongkang.cloud)
### [Lei Wei](https://www.linkedin.com/in/lei-wei-96727950/)
