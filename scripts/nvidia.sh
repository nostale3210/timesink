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

KERNEL_VERSION="$(rpm -q kernel --queryformat '%{VERSION}-%{RELEASE}.%{ARCH}')"

akmods --force --kernels "${KERNEL_VERSION}" --kmod nvidia

systemctl enable nvidia-{suspend,resume,hibernate}
