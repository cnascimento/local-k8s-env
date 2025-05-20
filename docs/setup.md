# Cluster k8s local

Docker registry local para push e pull das imagens:

    docker run -d -p 5000:5000 --name registry registry:2.8

Build da imagem, tem que estar dentro da pasta ./src:

    docker build -t cdnsistemas.registry.local:5000/cdnauthserver:X.X.X -f SimpliAuthServer/Dockerfile .

Push da imagen ao registry local:

    cdnsistemas.registry.local:5000/cdnauthserver:X.X.X

Criar um cluster kubernetes local com o k3d:

    k3d cluster create cdn-cluster \
        --servers 1 --servers-memory 2Gb \
        --agents 3 --agents-memory 4Gb \
        --config k3d-config.yaml

    kubectl create namespace production --context=k3d-cdn-cluster

    helm install ingress-nginx ingress-nginx/ingress-nginx \
        --namespace ingress-nginx \
        --create-namespace \
        --values values-ingress-nginx.yaml \
        --kube-context=k3d-cdn-cluster