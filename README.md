#### Follow [@YongkangHe](https://twitter.com/yongkanghe) on Twitter, Subscribe [K8s Data Management](https://www.youtube.com/channel/UCm-sw1b23K-scoVSCDo30YQ?sub_confirmation=1) Youtube Channel

1 CMD in 6 mins to build a ready-to-use Kasten demo lab on GKE cluster (GKE+Postgresql+K10). 

I just want to build a GKE Cluster to play with the various Data Management capabilities e.g. Backup/Restore, Disaster Recovery and Application Mobility. It is challenging to create a GKE cluster from Google Cloud if you are not familiar to it. After the GKE Cluster is up running, we still need to install Kasten, create a sample DB, create policies etc.. The whole process is not that simple.

![image](https://user-images.githubusercontent.com/40347406/132093566-f98f3d69-1b39-4153-9f98-e47bcd0346d3.png?width=100)

This script based automation allows you to build a ready-to-use Kasten K10 demo environment running on GKE in about 6 minutes. For simplicity and cost optimization, the GKE cluster will have only one worker node and be built in the default vpc using the default subnet. This is bash shell based scripts which has been tested on Cloud Shell. Linux or MacOS terminal has not been tested though it might work as well. 

If you already have a GKE cluster running, you only need 3 minutes to protect containers on GKE cluster by k10-deploy.sh. 

# Create a Google Cloud Trial Account
[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/rjZsH3IeSrE/0.jpg)](https://www.youtube.com/watch?v=rjZsH3IeSrE)
#### Subscribe [K8s Data Management](https://www.youtube.com/channel/UCm-sw1b23K-scoVSCDo30YQ?sub_confirmation=1) Youtube Channel

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


# Deploy based on your needs

| Don't have a GKE cluster  | Already have a GKE cluster      | Have nothing                    |
|---------------------------|---------------------------------|---------------------------------|
| Deploy GKE                | Deploy K10                      | Deploy GKE and K10              |
| ``` ./gke-deploy.sh ```   | ``` ./k10-deploy.sh ```         | ``` ./deploy.sh ```             |
| 1.Create a GKE Cluster    |                                 | 1.Create a GKE Cluster          |
|                           | 1.Install Kasten K10            | 2.Install Kasten K10            |
|                           | 2.Deploy a Postgresql database  | 3.Deploy a Postgresql database  |
|                           | 3.Create a GCS profile          | 4.Create a GCS profile          |
|                           | 4.Create a backup policy        | 5.Create a backup policy        |
|                           | 5.Kick off on-demand backup job | 6.Kick off on-demand backup job |

# Destroy based on your needs

| Destroy GKE               | Destroy K10                         | Destroy GKE and K10                 |
|---------------------------|-------------------------------------|-------------------------------------|
| ``` ./gke-destroy.sh ```  | ``` ./k10-destroy.sh ```            | ``` ./destroy.sh ```                |
| 1.Remove the GKE Cluster  |                                     | 1.Remove the GKE Cluster            |
|                           | 1.Remove Postgresql database        | 2.Remove all the relevant disks     |
|                           | 2.Remove Kasten K10                 | 3.Remove all the relevant snapshots |
|                           | 3.Remove the GCS storage bucket     | 4.Remove the GCS storage bucket     |

# K10 on GKE self-paced Lab Guide
http://gcp-lg.yongkang.cloud

# Kasten on GCP Workshop
[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/vPVV73m0Gd8/0.jpg)](https://www.youtube.com/watch?v=vPVV73m0Gd8)
#### Subscribe [K8s Data Management](https://www.youtube.com/channel/UCm-sw1b23K-scoVSCDo30YQ?sub_confirmation=1) Youtube Channel

# Build a GKE cluster via Web UI
[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/YwfPqR5phLM/0.jpg)](https://www.youtube.com/watch?v=YwfPqR5phLM)
#### Subscribe [K8s Data Management](https://www.youtube.com/channel/UCm-sw1b23K-scoVSCDo30YQ?sub_confirmation=1) Youtube Channel

# Protect containers on GKE cluster
[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/VF348wW7Hfw/0.jpg)](https://www.youtube.com/watch?v=VF348wW7Hfw)
#### Subscribe [K8s Data Management](https://www.youtube.com/channel/UCm-sw1b23K-scoVSCDo30YQ?sub_confirmation=1) Youtube Channel

# Build a GKE + K10 via Automation
[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/6vDEk_9cNaI/0.jpg)](https://www.youtube.com/watch?v=6vDEk_9cNaI)
#### Subscribe [K8s Data Management](https://www.youtube.com/channel/UCm-sw1b23K-scoVSCDo30YQ?sub_confirmation=1) Youtube Channel

# Build, Protect and Migrate Containers
[![IMAGE ALT TEXT HERE](https://pbs.twimg.com/media/FK5rsaeXwAIEmtI?format=jpg&name=small)](https://www.youtube.com/channel/UCm-sw1b23K-scoVSCDo30YQ)
#### Subscribe [K8s Data Management](https://www.youtube.com/channel/UCm-sw1b23K-scoVSCDo30YQ?sub_confirmation=1) Youtube Channel

# GKE Backup and Restore
https://blog.kasten.io/posts/postgresql-backup-and-restore-on-google-cloud-using-kasten-k10

# Kasten - No. 1 Kubernetes Backup
https://kasten.io 

# FREE Kubernetes Learning
https://learning.kasten.io 

# Contributors
#### Follow [Yongkang He](http://yongkang.cloud) on LinkedIn, Join [Kubernetes Data Management](https://www.linkedin.com/groups/13983251) LinkedIn Group

### [Lei Wei](https://www.linkedin.com/in/lei-wei-96727950/)
