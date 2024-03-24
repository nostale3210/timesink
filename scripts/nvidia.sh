#!/usr/bin/env bash

set -oue pipefail

echo "-----Building & Installing nvidia drivers-----"

mkdir -p /var/lib/alternatives
mkdir -p /tmp
mkdir -p /var/tmp
chmod 1777 /tmp /var/tmp

rpm-ostree install \
    binutils \
    akmods \
    mock \
    akmod-nvidia \
    xorg-x11-drv-nvidia \
    xorg-x11-drv-nvidia-cuda \
    xorg-x11-drv-nvidia-power \
    xorg-x11-drv-nvidia-cuda-libs \
    nvidia-vaapi-driver \
    libva-utils \
    vdpauinfo \
    kernel-devel-$(rpm -qa kernel --queryformat '%{VERSION}-%{RELEASE}.%{ARCH}')

ln -s /usr/bin/ld.bfd /etc/alternatives/ld && ln -s /etc/alternatives/ld /usr/bin/ld

RELEASE="$(rpm -E '%fedora.%_arch')"
KERNEL_VERSION="$(rpm -q kernel --queryformat '%{VERSION}-%{RELEASE}.%{ARCH}')"
NVIDIA_PACKAGE_NAME="nvidia"
NVIDIA_AKMOD_VERSION="$(basename "$(rpm -q "akmod-${NVIDIA_PACKAGE_NAME}" --queryformat '%{VERSION}-%{RELEASE}')" ".fc${RELEASE%%.*}")"

akmods --force --kernels "${KERNEL_VERSION}" --kmod "${NVIDIA_PACKAGE_NAME}"

modinfo /usr/lib/modules/${KERNEL_VERSION}/extra/${NVIDIA_PACKAGE_NAME}/nvidia{,-drm,-modeset,-uvm}.ko.xz > /dev/null || \
(cat /var/cache/akmods/${NVIDIA_PACKAGE_NAME}/${NVIDIA_AKMOD_VERSION}-for-${KERNEL_VERSION}.failed.log && exit 1)

systemctl enable nvidia-{suspend,resume,hibernate}

rpm-ostree override replace \
    --experimental \
    --from repo=copr:copr.fedorainfracloud.org:gloriouseggroll:nvidia-explicit-sync \
    xorg-x11-server-Xwayland

/scripts/cleanup.sh nvidia
