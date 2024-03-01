#!/usr/bin/env bash

set -oue pipefail

wget https://copr.fedorainfracloud.org/coprs/kylegospo/system76-scheduler/repo/fedora-$(rpm -E %fedora)/kylegospo-system76-scheduler-fedora-$(rpm -E %fedora).repo -O /etc/yum.repos.d/_copr_kylegospo-system76-scheduler.repo
wget https://pkgs.tailscale.com/stable/fedora/tailscale.repo -O /etc/yum.repos.d/tailscale.repo

rpm-ostree install \
    fastfetch \
    neovim \
    papirus-icon-theme \
    powertop \
    python3-pip \
    system76-scheduler \
    tailscale
rpm-ostree override remove \
    toolbox

pip install --prefix=/usr topgrade

curl -L https://hydra.nixos.org/job/nix/master/buildStatic.x86_64-linux/latest/download-by-type/file/binary-dist > /usr/bin/nix
curl -L https://proot.gitlab.io/proot/bin/proot > /usr/bin/proot
curl --proto '=https' --tlsv1.2 -fsSL https://drop-sh.fullyjustified.net |sh
chmod +x tectonic && mv tectonic /usr/bin/tectonic
chmod +x /usr/bin/nix
chmod +x /usr/bin/proot
chmod +x /usr/bin/nx
chmod +x /usr/bin/ne
chmod +x /usr/bin/nenv
chmod +x /usr/bin/nix-index

mkdir -p /usr/etc/flatpak/remotes.d
wget -q https://dl.flathub.org/repo/flathub.flatpakrepo -P /usr/etc/flatpak/remotes.d

chmod +x /usr/libexec/flatpak-manager
chmod +x /usr/libexec/topgrade-setup

systemctl enable com.system76.Scheduler.service
systemctl enable dconf-update.service
systemctl enable flatpak-manager.service
systemctl enable tailscaled.service

systemctl --global enable topgrade.timer
systemctl --global enable topgrade-setup.service

mkdir -p /usr/share/fonts/Noto
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Noto.tar.xz
tar -xf Noto.tar.xz --directory /usr/share/fonts/Noto
rm -rf Noto.tar.xz

glib-compile-schemas /usr/share/glib-2.0/schemas