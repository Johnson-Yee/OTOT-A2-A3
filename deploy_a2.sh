echo "View Cluster Information"
kubectl cluster-info
echo

echo "Check ingress-readiness of nodes"
kubectl get nodes -L ingress-ready
echo

echo "Apply Deployment.yaml Manifest"
kubectl apply -f ./k8s/manifests/deployment.yaml
echo

sleep 70

echo "Check Deployment Manifest"
kubectl get deployment/backend
echo

echo "Create Nginx Ingress Controller"
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
echo

sleep 180

echo "Check Ingress Controller"
kubectl -n ingress-nginx get deploy
echo

echo "Apply Service.yaml Manifest"
kubectl apply -f ./k8s/manifests/service.yaml
echo

sleep 5

echo "Check Service Manifest"
kubectl get svc
echo

echo "Apply ingress.yaml Manifest"
# Temp fix to remove webhook failed call. Apply ingres.yaml manifest works fine from command line
kubectl delete -A ValidatingWebhookConfiguration ingress-nginx-admission
kubectl apply -f ./k8s/manifests/ingress.yaml
echo

sleep 10

echo "Check ingress Manifest"
kubectl get ingress
echo

echo "You can check localhost/app and localhost now"