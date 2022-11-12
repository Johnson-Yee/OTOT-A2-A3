
echo "Check zones of node"
kubectl get nodes -L topology.kubernetes.io/zone
echo

echo "Apply backend zone aware manifest"
kubectl apply -f ./k8s/manifests/backend-zone-aware.yaml
echo

sleep 80

echo "Check deployments"
kubectl get po -lapp=backend-zone-aware -owide --sort-by='.spec.nodeName'
