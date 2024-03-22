#!/usr/bin/env bash

set -oue pipefail

rpm-ostree override remove \
    adcli \
    chrony \
    clevis \
    clevis-luks \
    clevis-systemd \
    clevis-dracut \
    coreos-installer \
    coreos-installer-bootinfra \
    ignition \
    iscsi-initiator-utils \
    iscsi-initiator-utils-iscsiuio \
    isns-utils-libs \
    moby-engine \
    NetworkManager-team \
    teamd \
    zincati

rpm-ostree install \
    gstreamer1-plugin-libav \
    gstreamer1-plugins-bad-free-extras \
    gstreamer1-plugins-ugly \
    gstreamer1-vaapi \
    steam-devices \
    git-core \
    libinput \
    flatpak \
    firefox \
    ffmpeg
