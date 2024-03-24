#!/usr/bin/env bash

echo ${GPU_VENDOR}
echo ${IMAGE_DE}

SCRIPTS=()
SCRIPTS+=("add-repos" "common" "fusion")

if [[ "${GPU_VENDOR}" = "nonvidia" ]]; then
    SCRIPTS+=("amdel")
    rm -rf /etc/environment /etc/pki/akmods/certs/public_key.der /etc/pki/akmods/private/private_key.priv
else
    SCRIPTS+=("nvidia")
fi

if [[ "${IMAGE_DE}" = "silverblue" ]]; then
    SCRIPTS+=("gnome")
else
    SCRIPTS+=("hypr")
fi

SCRIPTS+=("disable-repos")

for script in ${SCRIPTS[@]}; do
    echo "=====Running script: $script====="
    /scripts/$script.sh;
    /scripts/cleanup.sh $script;
done
