# !/bin/bash
# This script creates a local Kubernetes cluster using k3d with the specified configuration.
# It sets up a cluster with 1 server and 3 agents, each with specified memory limits.

k3d cluster create local-cluster \
    --servers 1 --servers-memory 2Gb \
    --agents 3 --agents-memory 4Gb \
    --config ./config/k3d-config.yaml

# Wait for the cluster to be ready
echo "Waiting for the cluster to be ready..."
while ! k3d cluster get local-cluster > /dev/null 2>&1; do
    sleep 5
done
echo "Cluster local-cluster is ready."
# Get the kubeconfig file for the cluster