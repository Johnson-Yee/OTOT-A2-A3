echo "Restart metric server after edit"
kubectl -nkube-system rollout restart deploy/metrics-server
echo

sleep 30

echo "Check readiness of metric server"
kubectl get pods --all-namespaces | grep metrics
echo

echo "Apply Horizontal Pod Autoscaler Manifest"
echo "Do note that threshold has been set to 5% to show scaling"
kubectl apply -f ./k8s/manifests/horizontalPodAutoscaler.yaml
echo

sleep 20

echo "Describe HPA"
kubectl describe horizontalPodAutoscaler
echo

echo "refresh page to simulate or use stressTest.sh"
echo "Kubectl get po --watch to see spinning up of new pods"
kubectl get po --watch