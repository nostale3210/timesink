#!/usr/bin/env bash

set -oue pipefail

rpm-ostree install \
    adw-gtk3-theme \
    gnome-shell-extension-system76-scheduler \
    gnome-tweaks \
    nautilus-python
rpm-ostree override remove \
    gnome-terminal-nautilus \
    gnome-tour \
    yelp

pip install --prefix=/usr nautilus-open-any-terminal

echo "com.raggesilver.BlackBox" >> /usr/share/timesink/flatpak/install
echo "com.mattjakeman.ExtensionManager" >> /usr/share/timesink/flatpak/install

sed -i "s/Evolution/Geary/g" /usr/share/timesink/flatpak/install

sed -i 's@\[Desktop Entry\]@\[Desktop Entry\]\nNoDisplay=true@g' /usr/share/applications/org.gnome.Terminal.desktop

glib-compile-schemas /usr/share/glib-2.0/schemas
