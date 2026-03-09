#!/bin/bash
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

NODE_IP="192.168.56.110"

echo "Installing K3s server on ${NODE_IP}..."

if [ ! -f /etc/systemd/system/k3s.service ]; then
  curl -sfL https://get.k3s.io | sh -s - --node-ip=${NODE_IP} --write-kubeconfig-mode 644
fi

until [ -f /var/lib/rancher/k3s/server/token ]; do
  sleep 1
done

mkdir -p /vagrant/confs
cp /var/lib/rancher/k3s/server/token /vagrant/confs/node-token

echo "K3s server installed."
echo "Token copied to /vagrant/confs/node-token"