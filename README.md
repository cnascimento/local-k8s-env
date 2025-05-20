# Local k8s Environment

A public repository containing configuration files and documentation for setting up a local Kubernetes environment using k3d. Ideal for development, testing, and learning purposes.

# Folder Structure

    k3d-local-cluster/
    ├── config/                     # Arquivos de configuração do k3d
    │   ├── k3d-cluster.yaml         # Configuração do cluster k3d
    │   └── registries.yaml          # (Opcional) Configuração de registries locais
    ├── charts/                     # Charts Helm customizados, se houver
    │   └── <custom-chart>/          # Seu próprio chart Helm, se não usar só charts públicos
    ├── helm/                       # Instalação via Helm de aplicativos (infra + apps)
    │   ├── infra/                   # Charts de infraestrutura
    │   │   ├── rabbitmq/             # Valores customizados para o chart oficial
    │   │   │   └── values.yaml
    │   │   ├── redis/
    │   │   │   └── values.yaml
    │   │   └── postgresql/
    │   │       └── values.yaml
    │   └── apps/                    # Aplicações de negócio ou exemplos
    │       ├── my-app-1/
    │       │   └── values.yaml
    │       └── my-app-2/
    │           └── values.yaml
    ├── scripts/                    # Scripts de automação (install, delete, etc)
    │   ├── create-cluster.sh        # Criação do cluster k3d
    │   ├── install-infra.sh         # Instalação da stack de infraestrutura via Helm
    │   ├── install-apps.sh          # Instalação das aplicações via Helm
    │   └── delete-cluster.sh        # Remoção do cluster
    ├── docs/                       # Documentação em Markdown
    │   ├── setup.md                 # Passos de configuração do cluster
    │   ├── helm-guide.md            # Como usar os charts Helm
    │   ├── networking.md            # Info sobre ingress, DNS local, etc.
    │   └── registry.md              # Como configurar e usar registry local
    ├── .gitignore
    ├── README.md                   # Visão geral do repositório
    └── LICENSE
