kubectl run wls-domain-web --image=nginx --replicas=3 --port=80
kubectl expose deployment wls-domain-web --port=80 --type=NodePort

kubectl create configmap nginxconfigmap --from-file=config-maps/nginx.conf
