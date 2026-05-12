# Inception-of-Thngs — Kubernetes (k3s) on Vagrant (École 42)

Projet 42 orienté Kubernetes : mise en place d’un cluster **k3s** via **Vagrant**, déploiements, et automatisation par scripts (setup/init/clean).  
Le dépôt est un **fork** : il contient ma version de travail (scripts, manifests/confs, documentation).

---

## Objectifs
- Déployer un cluster Kubernetes léger (**k3s**) dans un environnement reproductible (Vagrant/VM)
- Comprendre la séparation **control-plane (server)** / **workers**
- Apprendre les bases d’exploitation : `kubectl`, debug, services/ingress (selon partie)
- Automatiser l’installation et le reset via scripts

---

## Structure du repo
```text
.
├── p1/                 # cluster k3s (server + worker) via Vagrant + scripts
│   ├── Vagrantfile
│   └── scripts/
│       ├── common.sh
│       ├── server.sh
│       └── worker.sh
├── p2/                 # itération suivante (confs + init)
│   ├── Vagrantfile
│   ├── confs/
│   └── scripts/
│       └── init.sh
├── p3/                 # automatisation via Makefile + scripts setup/init/clean
│   ├── Makefile
│   ├── confs/
│   └── scripts/
│       ├── setup.sh
│       ├── init.sh
│       └── clean.sh
└── bonus/              # bonus (ex: DNS/CoreDNS, etc.)
    ├── Makefile
    ├── confs/
    └── scripts/
        ├── setup_bonus.sh
        ├── init_bonus.sh
        ├── clean_bonus.sh
        └── coredns.sh
```

---

## Prérequis
- Linux
- [Vagrant] + provider VM (Virtual
