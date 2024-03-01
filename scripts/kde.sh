#!/usr/bin/env bash

set -oue pipefail

git clone https://github.com/maxiberta/kwin-system76-scheduler-integration.git --depth 1 /tmp/kwin-system76-scheduler-integration
git clone https://github.com/catsout/wallpaper-engine-kde-plugin.git --depth 1 /tmp/wallpaper-engine-kde-plugin
kpackagetool5 --type=KWin/Script --global --install /tmp/kwin-system76-scheduler-integration
kpackagetool5 --type=Plasma/Wallpaper --global --install /tmp/wallpaper-engine-kde-plugin/plugin
rm -rf /tmp/kwin-system76-scheduler-integration
rm -rf /tmp/wallpaper-engine-kde-plugin
