#!/usr/bin/env bash

set -oue pipefail

rpm-ostree install \
    dbus-devel \
    glib2 \
    glib2-devel \
    cmake \
    wget
