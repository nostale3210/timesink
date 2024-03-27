#!/usr/bin/env bash

set -oue pipefail

#packages for all images
rpm-ostree install \
    distrobox \
    fastfetch \
    kernel-core \
    neovim \
    nerd-fonts \
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
#pip install --prefix=/usr dbus-python

#nix
curl -L https://hydra.nixos.org/job/nix/master/buildStatic.x86_64-linux/latest/download-by-type/file/binary-dist > /usr/bin/nix
chmod +x /usr/bin/nix
chmod +x /usr/bin/nx
chmod +x /usr/bin/ne
chmod +x /usr/bin/nenv
chmod +x /usr/bin/nix-index

#zellij
curl -L https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz > zellij.tar.gz
tar -xf zellij.tar.gz --directory /usr/bin/
chmod +x /usr/bin/zellij

#proot
curl -L https://proot.gitlab.io/proot/bin/proot > /usr/bin/proot
chmod +x /usr/bin/proot

#tectonic
curl --proto '=https' --tlsv1.2 -fsSL https://drop-sh.fullyjustified.net |sh
chmod +x tectonic && mv tectonic /usr/bin/tectonic

#ollama
curl -L https://ollama.com/download/ollama-linux-amd64 -o /usr/bin/ollama
chmod +x /usr/bin/ollama

#android-udev
chmod a+r /usr/etc/udev/rules.d/51-android.rules

#add Flathub
mkdir -p /usr/etc/flatpak/remotes.d
wget -q https://dl.flathub.org/repo/flathub.flatpakrepo -P /usr/etc/flatpak/remotes.d

#binaries for services
chmod +x /usr/libexec/flatpak-manager
chmod +x /usr/libexec/topgrade-setup

#systemd system
systemctl enable com.system76.Scheduler.service
systemctl enable dconf-update.service
systemctl enable flatpak-manager.service
systemctl enable tailscaled.service

#systemd user
systemctl --global enable topgrade.timer
systemctl --global enable topgrade-setup.service

#fonts
mkdir -p /usr/share/fonts/Lilex
curl -OL https://github.com/mishamyrt/Lilex/releases/latest/download/Lilex.zip
unzip -j Lilex.zip ttf/* -d /usr/share/fonts/Lilex/
rm -rf Lilex.zip

fc-cache -f -v

#themes
mkdir -p /usr/share/icons
curl -OL https://github.com/ful1e5/Bibata_Cursor/releases/latest/download/Bibata-Modern-Classic.tar.xz
tar -xf Bibata-Modern-Classic.tar.xz --directory /usr/share/icons/
rm -rf Bibata-Modern-Classic.tar.xz
