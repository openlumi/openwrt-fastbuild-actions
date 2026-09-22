#!/bin/bash

echo "=============================================="
rm ./package/feeds/packages/node
rm ./package/feeds/packages/node-*
./scripts/feeds update node
./scripts/feeds install -a -p node
./scripts/feeds update homeassistant
./scripts/feeds install -a -p homeassistant
make defconfig
echo "=============================================="
