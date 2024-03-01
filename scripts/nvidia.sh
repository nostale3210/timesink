#!/usr/bin/env bash

set -oue pipefail

rpm-ostree install \
    akmod-nvidia \
    xorg-x11-drv-nvidia \
    xorg-x11-drv-nvidia-cuda \
    xorg-x11-drv-nvidia-power \
    xorg-x11-drv-nvidia-cuda-libs \
    nvidia-vaapi-driver \
    libva-utils \
    vdpauinfo

/usr/sbin/akmods --force

systemctl enable nvidia-{suspend,resume,hibernate}
