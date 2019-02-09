SET KUBECONFIG=C:/Users/GOUTAMSARKAR/.bluemix/plugins/container-service/clusters/mycluster/kube-config-mel01-mycluster.yml
C:/GS/Software/Kubernetes/kubectl delete configmap vol-configmap
C:/GS/Software/Kubernetes/kubectl apply -f my-config.yaml
C:/GS/Software/Kubernetes/kubectl apply -f env-config.yaml
C:/GS/Software/Kubernetes/kubectl apply -f my-secret.yaml
C:/GS/Software/Kubernetes/kubectl create configmap vol-configmap --from-file=config.properties
C:/GS/Software/Kubernetes/kubectl apply -f configmap-env-test.yaml
C:/GS/Software/Kubernetes/kubectl apply -f configmap-volume-test.yaml
