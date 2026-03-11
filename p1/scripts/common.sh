#!/bin/bash
set -euo pipefail

apt-get update
apt-get install -y curl

echo "✅ Common provisioning done"
