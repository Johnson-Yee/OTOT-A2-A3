echo "Starting Deployment"
CLUSTER_NAME="kind-1"
kind create cluster --name $CLUSTER_NAME --config k8s/kind/cluster-config.yaml
echo "Cluster with name: $CLUSTER_NAME created"

echo "Load docker-image"
kind load docker-image johnson/otot_a1 --name kind-1
echo "Docker image loaded"