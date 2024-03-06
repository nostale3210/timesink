#!/usr/bin/env bash

set -oue pipefail

#maybe relevant for nvidia
mkdir -p /var/lib/alternatives
chmod 1777 /tmp /var/tmp

#packages for all images
rpm-ostree install \
    fastfetch \
    neovim \
    papirus-icon-theme \
    powertop \
    python3-pip \
    python3-gobject \
    system76-scheduler \
    tailscale
rpm-ostree override remove \
    toolbox

pip install --prefix=/usr topgrade
pip install --prefix=/usr pynvim
pip install --prefix=/usr dbus-python

#nix + proot and tectonic
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

#Add Flathub
mkdir -p /usr/etc/flatpak/remotes.d
wget -q https://dl.flathub.org/repo/flathub.flatpakrepo -P /usr/etc/flatpak/remotes.d

#Binaries for services
chmod +x /usr/libexec/flatpak-manager
chmod +x /usr/libexec/topgrade-setup

#systemd
systemctl enable com.system76.Scheduler.service
systemctl enable dconf-update.service
systemctl enable flatpak-manager.service
systemctl enable tailscaled.service

systemctl --global enable topgrade.timer
systemctl --global enable topgrade-setup.service

#Fonts
mkdir -p /usr/share/fonts/Noto
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Noto.tar.xz
tar -xf Noto.tar.xz --directory /usr/share/fonts/Noto/
rm -rf Noto.tar.xz

fc-cache -f -v

#Themes
mkdir -p /usr/share/icons
curl -OL https://github.com/ful1e5/Bibata_Cursor/releases/latest/download/Bibata-Modern-Classic.tar.xz
tar -xf Bibata-Modern-Classic.tar.xz --directory /usr/share/icons/
rm -rf Bibata-Modern-Classic.tar.xz
