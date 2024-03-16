#!/usr/bin/env bash

set -oue pipefail

rpm-ostree install \
    dbus \
    dbus-devel \
    dbus-broker \
    glib2 \
    glib2-devel \
    cmake \
    wget
