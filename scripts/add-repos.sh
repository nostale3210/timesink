#!/usr/bin/env bash

set -oue pipefail

wget https://copr.fedorainfracloud.org/coprs/che/nerd-fonts/repo/fedora-$(rpm -E %fedora)/che-nerd-fonts-fedora-$(rpm -E %fedora).repo -O /etc/yum.repos.d/_copr_che-nerd-fonts.repo
wget https://copr.fedorainfracloud.org/coprs/gloriouseggroll/nvidia-explicit-sync/repo/fedora-$(rpm -E %fedora)/gloriouseggroll-nvidia-explicit-sync-fedora-$(rpm -E %fedora).repo?arch=x86_64 -O /etc/yum.repos.d/_copr_gloriouseggroll-nvidia-explicit-sync.repo
wget https://copr.fedorainfracloud.org/coprs/kylegospo/system76-scheduler/repo/fedora-$(rpm -E %fedora)/kylegospo-system76-scheduler-fedora-$(rpm -E %fedora).repo -O /etc/yum.repos.d/_copr_kylegospo-system76-scheduler.repo
wget https://copr.fedorainfracloud.org/coprs/solopasha/hyprland/repo/fedora-$(rpm -E %fedora)/solopasha-hyprland-fedora-$(rpm -E %fedora).repo -O /etc/yum.repos.d/_copr_solopasha-hyprland.repo
wget https://pkgs.tailscale.com/stable/fedora/tailscale.repo -O /etc/yum.repos.d/tailscale.repo

rpm-ostree install \
    https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
rpm-ostree install \
    rpmfusion-free-release \
    rpmfusion-nonfree-release \
    --uninstall rpmfusion-free-release \
    --uninstall rpmfusion-nonfree-release

/tmp/scripts/cleanup.sh
