#!/usr/bin/env bash

set -oue pipefail

rpm-ostree install \
    hyprland \
    hyprpaper \
    hyprpicker \
    hypridle \
    hyprlock \
    hyprcursor \
    hyprshot \
    xdg-desktop-portal-hyprland \
    xdg-desktop-portal-gtk \
    wofi \
    foot \
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
    NetworkManager-openvpn \
    NetworkManager-pptp \
    NetworkManager-strongswan \
    NetworkManager-vpnc \
    NetworkManager-iodine \
    NetworkManager-libreswan \
    NetworkManager-ssh \
    NetworkManager-sstp \
    NetworkManager-l2tp \
    qt5ct \
    qt6ct \
    waybar \
    pamixer \
    pavucontrol \
    polkit-gnome \
    gnome-keyring \
    gnome-keyring-pam \
    libsecret \
    seahorse \
    qt \
    wlogout \
    xdg-user-dirs \
    xdg-user-dirs-gtk \
    xdg-utils \
    gnome-system-monitor \
    gnome-disk-utility \
    udiskie \
    sddm \
    qt5-qtgraphicaleffects \
    qt5-qtquickcontrols2 \
    qt5-qtsvg \
    ffmpegthumbnailer \
    Thunar \
    thunar-volman \
    tumbler \
    thunar-archive-plugin \
    file-roller \
    adwaita-qt5 \
    adwaita-qt6 \
    qadwaitadecorations-qt5 \
    adw-gtk3-theme \
    tuned \
    tuned-ppd \
    tuned-utils \
    tuned-switcher \
    tuned-profiles-atomic \
    tuned-profiles-cpu-partitioning \
    xwaylandvideobridge

rpm-ostree uninstall \
    kitty \
    kitty-kitten \
    kitty-shell-integration \
    kitty-terminfo

chmod +x /usr/libexec/dotfile-manager

systemctl enable tuned.service
systemctl enable bluetooth.service
systemctl enable sddm.service

systemctl --global enable gnome-keyring-daemon.service
systemctl --global enable dotfile-manager.service

/tmp/scripts/cleanup.sh
