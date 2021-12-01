k10ui=http://$(kubectl get svc gateway-ext -n kasten-io | awk '{print $4}'|grep -v EXTERNAL)/k10/#
echo $k10ui >> gke-token
cat gke-token
./runonce.sh
echo "" | awk '{print $1}'
