#!/usr/bin/env bash

set -oue pipefail

rpm-ostree override remove \
    adcli \
    chrony \
    clevis \
    clevis-luks \
    clevis-systemd \
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
