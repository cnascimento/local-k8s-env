# !/bin/bash
# This script installs the necessary infrastructure components for the local Kubernetes cluster.

helm repo add harbor https://helm.goharbor.io # Add the Harbor Helm repository
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
while ! kubectl get pods -n ingress-nginx | grep -q Running; do
    sleep 5 # Wait for the NGINX Ingress Controller to be ready
done

# Install the Harbor chart
helm upgrade --install \
  --namespace harbor \
  --create-namespace \
  harbor harbor/harbor \
  -f ./helm/infra/harbor/values.yaml \
  --kube-context k3d-local-cluster