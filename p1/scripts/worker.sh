#!/usr/bin/env bash
set -euo pipefail

SERVER_IP="192.168.56.110"
NODE_IP="192.168.56.111"
TOKEN_FILE="/vagrant/confs/node-token"

echo "Installing K3s agent on ${NODE_IP}..."

for _ in $(seq 1 180); do
  if [ -f "${TOKEN_FILE}" ]; then
    break
  fi
  echo "waiting for token..."
  sleep 2
done

if [ ! -f "${TOKEN_FILE}" ]; then
  echo "K3s token not found in ${TOKEN_FILE}" >&2
  exit 1
fi

if [ ! -f /etc/systemd/system/k3s-agent.service ]; then
  curl -sfL https://get.k3s.io | \
    K3S_URL="https://${SERVER_IP}:6443" \
    K3S_TOKEN="$(cat "${TOKEN_FILE}")" \
    sh -s - --node-ip="${NODE_IP}"
fi

echo "K3s agent installed."