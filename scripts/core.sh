#!/usr/bin/env bash

set -oue pipefail

rpm-ostree install \
    wget

systemctl disable zincati.service
