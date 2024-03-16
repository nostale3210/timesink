#!/usr/bin/env bash

set -oue pipefail

rpm-ostree install \
    hyprland \
    hyprpaper \
    hyprpicker \
    hypridle \
    hyprlock \
    hyprshot \
    hyprcursor \
    xdg-desktop-portal-hyprland \
    xdg-desktop-portal-gtk \
    mako \
    pipewire \
    pipewire-pulseaudio \
    pipewire-gstreamer \
    pipewire-alsa \
    pipewire-jack-audio-connection-kit \
    pipewire-plugin-libcamera \
    wireplumber \
    pavucontrol \
    polkit-gnome \
    qt5-wayland \
    qt6-wayland \
    blueberry \
    hyprnome \
    network-manager-applet \
    NetworkManager \
    udiskie \
    wofi \
    waybar \
    xwaylandvideobridge \
    gdm
