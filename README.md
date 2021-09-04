It is challenging to create a GKE cluster from Google Cloud if you are not familiar to it. After the GKE Cluster is up running, we still need to install Kasten, create a sample DB, create policies etc.. 

This script based automation allows you to build a ready-to-use Kasten K10 demo environment running on GKE in about 6 minutes. Below tasks will be automatically completed within 10 minutes.

# Here're the prerequisities.
1. Install Cloud SDK https://cloud.google.com/sdk/docs/install#linux
2. Initialize glcoud, run **glcoud init**
3. Install git if not installed, https://www.linode.com/docs/guides/how-to-install-git-on-linux-mac-and-windows/
4. Clone the github repo to your local host, run **git clone https://github.com/yongkanghe/gke-k10.git**

# To build the labs, run **deploy.sh**
1. Create a GKE Kubernetes Cluster from CLI
2. Install Kasten K10
3. Create a location profile
4. Deploy a Postgres database
5. Create a backup policy
6. Kick off an on-demand backup job

# To delete the labs, run **destroy.sh**
1. Remove GKE Kubernetes Cluster
2. Remove all the relevant disks
3. Remove all the relevant snapshots

