#!/usr/bin/env bash

set -oue pipefail

rm -rf /tmp/* /var/*
ostree container commit
