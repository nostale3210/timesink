#!/usr/bin/env bash

set -oue pipefail

echo "-----Installing Intel and AMD drivers-----"

rpm-ostree install \
    intel-media-driver \
    libva-intel-driver
rpm-ostree override remove \
    mesa-va-drivers \
    --install mesa-va-drivers-freeworld \
    --install mesa-vdpau-drivers-freeworld

#/scripts/cleanup.sh amd+intel
