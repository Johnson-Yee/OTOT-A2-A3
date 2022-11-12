echo "Apply Metric Server"
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
echo

echo "Edit metric server to add in tls tag"
kubectl -nkube-system edit deploy/metrics-server

echo "add --kubelet-insecure-tls to deployment.spec.containers[].args[]"