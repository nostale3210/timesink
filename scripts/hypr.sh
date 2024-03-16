#!/usr/bin/env bash

set -oue pipefail

rpm-ostree install \
    hyprland \
    hyprpaper \
    hyprpicker \
    hypridle \
    hyprlock \
    hyprcursor \
    xdg-desktop-portal-hyprland \
    xdg-desktop-portal-gtk \
    wofi \
    kitty \
    mako \
    pipewire \
    wireplumber \
    bluez \
    bluez-tools \
    blueman \
    pipewire-pulseaudio \
    pipewire-alsa \
    network-manager-applet \
    NetworkManager \
    qt5ct \
    qt6ct \
    waybar \
    pamixer \
    pavucontrol \
    polkit-gnome \
    qt \
    wlogout \
    xdg-user-dirs \
    xdg-utils \
    gnome-system-monitor \
    gnome-disk-utility \
    udiskie \
    sddm \
    ffmpegthumbnailer \
    Thunar \
    thunar-volman \
    tumbler \
    thunar-archive-plugin \
    file-roller

systemctl enable bluetooth.service
systemctl enable sddm.service
