#!/bin/bash
set -e

# Uninstall k3d
if command -v k3d >/dev/null 2>&1; then
    echo "Uninstalling k3d..."

    # Remove all k3d clusters if present
    clusters=$(k3d cluster list -o simple 2>/dev/null || true)
    if [ -n "$clusters" ]; then
        for cluster in $clusters; do
            k3d cluster delete "$cluster"
        done
    fi

    # Remove k3d executable
    sudo rm -f "$(command -v k3d)"
    echo "k3d uninstalled successfully!"
else
    echo "k3d is not installed"
fi

# Uninstall kubectl
if command -v kubectl >/dev/null 2>&1; then
    echo "Uninstalling kubectl..."
    sudo rm -f "$(command -v kubectl)"
    echo "kubectl uninstalled successfully!"
else
    echo "kubectl is not installed"
fi

# Clean up configurations
echo "Cleaning up configurations..."
rm -rf ~/.kube

echo "Uninstallation complete!"
