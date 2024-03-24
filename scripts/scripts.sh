#!/usr/bin/env bash

set -oue pipefail

SCRIPTS=()
SCRIPTS+=("add-repos" "common" "fusion")

if [[ "$1" = "nonvidia" ]]; then
    SCRIPTS+=("amdel")
    rm -rf /etc/environment /etc/pki/akmods/certs/public_key.der /etc/pki/akmods/private/private_key.priv
else
    SCRIPTS+=("nvidia")
fi

if [[ "$2" = "silverblue" ]]; then
    SCRIPTS+=("gnome")
else
    SCRIPTS+=("hypr")
fi

SCRIPTS+=("disable-repos")

echo ${SCRIPTS[@]}
