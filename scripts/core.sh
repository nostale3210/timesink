#!/usr/bin/env bash

set -oue pipefail

rpm-ostree install \
    ffmpeg \
    firefox \
    gstreamer1-plugin-libav \
    gstreamer1-plugins-bad-free-extras \
    gstreamer1-plugins-ugly \
    gstreamer1-vaapi \
    steam-devices

systemctl disable zincati.service
