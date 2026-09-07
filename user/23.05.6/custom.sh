#!/bin/bash

set -euo pipefail

echo "=============================================="
rm ./package/feeds/packages/node
rm ./package/feeds/packages/node-*
./scripts/feeds update node
./scripts/feeds install -a -p node

NODE_PACKAGES_TMP="$(mktemp -d)"
git clone --depth 1 --branch openwrt-24.10 \
  https://github.com/nxhack/openwrt-node-packages.git \
  "${NODE_PACKAGES_TMP}"
rm -rf feeds/node/node-zigbee2mqtt
cp -a "${NODE_PACKAGES_TMP}/node-zigbee2mqtt" feeds/node/
rm -rf package/feeds/node/node-zigbee2mqtt
./scripts/feeds install -a -p node
rm -rf "${NODE_PACKAGES_TMP}"

make defconfig
echo "=============================================="
