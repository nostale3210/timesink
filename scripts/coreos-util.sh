#!/usr/bin/env bash

set -oue pipefail

rpm-ostree install \
    dbus-devel \
    wget
