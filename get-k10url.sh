k10ui=http://$(kubectl get svc gateway-ext -n kasten-io | awk '{print $4}'|grep -v EXTERNAL)/k10/#
echo -e "\nCopy below token before clicking the link to log into K10 Web UI -->> $k10ui" >> gke-token
echo "" | awk '{print $1}' >> gke-token
sa_secret=$(kubectl get serviceaccount k10-k10 -o jsonpath="{.secrets[0].name}" --namespace kasten-io)
echo "Here is the token to login K10 Web UI" >> gke-token
echo "" | awk '{print $1}' >> gke-token
kubectl get secret $sa_secret --namespace kasten-io -ojsonpath="{.data.token}{'\n'}" | base64 --decode | awk '{print $1}' >> gke-token
echo "" | awk '{print $1}' >> gke-token

cat gke-token

#./runonce.sh

echo "" | awk '{print $1}'
