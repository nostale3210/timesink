#!/usr/bin/env bash

set -oue pipefail

rpm-ostree install \
    gnome-shell-extension-system76-scheduler \
    nautilus-python
rpm-ostree override remove \
    gnome-terminal-nautilus \
    gnome-tour \
    yelp

pip install --prefix=/usr nautilus-open-any-terminal

sed -i 's@\[Desktop Entry\]@\[Desktop Entry\]\nNoDisplay=true@g' /usr/share/applications/org.gnome.Terminal.desktop