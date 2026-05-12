# Inception-of-Thngs — Kubernetes (k3s/k3d) Lab (École 42)

Projet 42 orienté Kubernetes : mise en place de clusters **k3s** (sur VM via Vagrant/VirtualBox) et **k3d** (k3s dans Docker), déploiements, et automatisation par scripts/Makefile.

> Repo forké : ce dépôt contient ma version de travail (scripts, confs/manifests, et documentation).

---

## Objectifs
- Comprendre et déployer Kubernetes “léger” avec **k3s**
- Utiliser **k3d** pour créer des clusters k3s dans Docker (workflow plus “dev”)
- Apprendre l’exploitation : `kubectl`, debug (pods/logs), services/ingress (selon partie)
- Automatiser installation, setup et nettoyage (scripts)

---

## Structure du repo
```text
.
├── p1/                 # k3s via Vagrant/VirtualBox (server + worker)
│   ├── Vagrantfile
│   └── scripts/
│       ├── common.sh
│       ├── server.sh
│       └── worker.sh
├── p2/                 # k3s via Vagrant/VirtualBox (confs + init)
│   ├── Vagrantfile
│   ├── confs/
│   └── scripts/
│       └── init.sh
├── p3/                 # k3d (k3s dans Docker) + automatisation
│   ├── Makefile
│   ├── confs/
│   └── scripts/
│       ├── setup.sh
│       ├── init.sh
│       └── clean.sh
└── bonus/              # bonus (k3d) + DNS (CoreDNS) et automatisation
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
### Pour p1 / p2 (k3s sur VM)
- Linux
- **VirtualBox**
- **Vagrant**

### Pour p3 / bonus (k3d)
- Linux
- **Docker**
- **kubectl**
- **k3d**

---

## Run
### p1 (k3s via Vagrant)
```bash
cd p1
vagrant up
# selon tes scripts, tu peux ensuite vérifier :
kubectl get nodes -o wide
```

### p2 (k3s via Vagrant)
```bash
cd p2
vagrant up
```

### p3 (k3d)
```bash
cd p3
make
# ou selon ton Makefile :
make all
```

### bonus (k3d)
```bash
cd bonus
make
# ou :
make all
```

> Astuce debug :
```bash
kubectl get pods -A
kubectl get svc -A
kubectl logs -f <pod> -n <namespace>
```

---

## Ce que j’ai appris
- Déploiement et administration d’environnements Kubernetes légers (**k3s/k3d**)
- Différences VM vs Docker pour un cluster de dev
- Debug réseau/app au niveau cluster (pods/services/logs)
- Automatisation (scripts bash, Makefile) et approche reproductible

---

## Security notes (bonnes pratiques)
- Éviter les secrets en clair (préférer variables d’environnement / Secrets Kubernetes si applicable)
- Limiter l’exposition réseau (ports, ingress), garder un “blast radius” minimal
- Garder le cluster **jetable** : scripts de clean pour repartir propre

---
## Licence
Projet pédagogique (École 42).
