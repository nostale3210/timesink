#!/usr/bin/env bash

set -oue pipefail

echo "-----Installing codecs from rpmfusion-----"

rpm-ostree override remove \
    libavfilter-free \
    libavformat-free \
    libavcodec-free \
    libavutil-free \
    libpostproc-free \
    libswresample-free \
    libswscale-free \
    --install ffmpeg
rpm-ostree install \
    gstreamer1-plugin-libav \
    gstreamer1-plugins-bad-free-extras \
    gstreamer1-plugins-ugly \
    gstreamer1-vaapi \
    steam-devices

/scripts/cleanup.sh rpmfusion
