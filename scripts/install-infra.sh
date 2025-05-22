# !/bin/bash
# This script installs the necessary infrastructure components for the local Kubernetes cluster.

helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx # Add the NGINX Ingress Controller Helm repository

helm repo update

# It uses Helm to install the NGINX Ingress Controller.
helm upgrade --install \
  --namespace ingress-nginx \
  --create-namespace \
  ingress-nginx ingress-nginx/ingress-nginx \
  -f ./helm/infra/ingress-nginx/values.yaml \
  --kube-context k3d-local-cluster \

# Wait for the NGINX Ingress Controller to be ready
while ! kubectl get pods -n ingress-nginx | grep Running; do
    sleep 5 # Wait for the NGINX Ingress Controller to be ready
done
sleep 18
echo "*** NGINX Ingress Controller is ready ***"

helm upgrade --install \
  --namespace production \
  --create-namespace \
  network-tester ./charts/network-tester \
  --kube-context k3d-local-cluster