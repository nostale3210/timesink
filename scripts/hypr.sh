#!/usr/bin/env bash

set -oue pipefail

rpm-ostree install \
    NetworkManager \
    NetworkManager-iodine \
    NetworkManager-l2tp \
    NetworkManager-libreswan \
    NetworkManager-openvpn \
    NetworkManager-pptp \
    NetworkManager-ssh \
    NetworkManager-sstp \
    NetworkManager-strongswan \
    NetworkManager-vpnc \
    adw-gtk3-theme \
    adwaita-qt5 \
    adwaita-qt6 \
    blueman \
    blueman-nemo \
    bluez \
    bluez-tools \
    ffmpegthumbnailer \
    file-roller \
    foot \
    gnome-disk-utility \
    gnome-keyring \
    gnome-keyring-pam \
    gnome-system-monitor \
    gvfs-archive \
    gvfs-gphoto2 \
    gvfs-mtp \
    gvfs-smb \
    hyprcursor \
    hypridle \
    hyprland \
    hyprlock \
    hyprpaper \
    hyprpicker \
    hyprshot \
    libsecret \
    mako \
    nemo \
    nemo-fileroller \
    nemo-image-converter \
    nemo-preview \
    network-manager-applet \
    pamixer \
    pavucontrol \
    pipewire \
    pipewire-alsa \
    pipewire-pulseaudio \
    polkit-gnome \
    qadwaitadecorations-qt5 \
    qt \
    qt5-qtgraphicaleffects \
    qt5-qtquickcontrols2 \
    qt5-qtsvg \
    qt5ct \
    qt6ct \
    sddm \
    seahorse \
    system-config-printer \
    tuned \
    tuned-ppd \
    tuned-profiles-atomic \
    tuned-profiles-cpu-partitioning \
    tuned-gtk \
    tuned-utils \
    udiskie \
    waybar \
    wireplumber \
    wlogout \
    wofi \
    xdg-desktop-portal-gtk \
    xdg-desktop-portal-hyprland \
    xdg-user-dirs \
    xdg-user-dirs-gtk \
    xdg-utils \
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
