#!/bin/bash

mv .config .config.diff
cp config_xiaomi_lumi .config
cat .config.diff >> .config

mkdir -p files
cp -r files_xiaomi_lumi/* files/
echo "=============================================="
rm ./package/feeds/packages/node
rm ./package/feeds/packages/node-*
./scripts/feeds update node
./scripts/feeds install -a -p node
make defconfig

echo "=============================================="
