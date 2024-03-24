#!/usr/bin/env bash

set -oue pipefail

echo "----------Cleaning up $1----------"

rm -rf /tmp/* /var/*
ostree container commit
