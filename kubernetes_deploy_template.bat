ibmcloud login -a API_END_POINT -apikey ${API_KEY} -o ORG -s SPACE
SET KUBECONFIG=CLUSTER_KUBE_CONFIG_PATH
kubectl apply -f CONFIG_MAP_YAML_FILE1
kubectl apply -f CONFIG_MAP_YAML_FILE2
kubectl apply -f SECRET_YAML_FILE
kubectl delete configmap CONFIG_MAP_PROP
kubectl create configmap CONFIG_MAP_PROP --from-file=CONFIG_MAP_PROP_FILE1
kubectl delete -f SERVICE_YAML_FILE1 
kubectl delete -f SERVICE_YAML_FILE2 
kubectl create -f SERVICE_YAML_FILE1 
kubectl create -f SERVICE_YAML_FILE2 
