#!/usr/bin/env bash
set -euo pipefail

NODE_IP="192.168.56.110"
TOKEN_FILE="/var/lib/rancher/k3s/server/node-token"

echo "Installing K3s server on ${NODE_IP}..."

if [ ! -f /etc/systemd/system/k3s.service ]; then
  curl -sfL https://get.k3s.io | sh -s - \
    --node-ip="${NODE_IP}" \
    --write-kubeconfig-mode=644
fi

until [ -f "${TOKEN_FILE}" ]; do
  sleep 1
done

mkdir -p /vagrant/confs
cp "${TOKEN_FILE}" /vagrant/confs/node-token

echo "K3s server installed."
echo "Token copied to /vagrant/confs/node-token"