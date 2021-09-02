#!/bin/bash

mv .config .config.diff
cp config_xiaomi_lumi .config
echo "CONFIG_ALL_KMODS=y" >> .config
cat .config.diff >> .config

mkdir -p files
cp -r files_xiaomi_lumi/* files/

echo "=============================================="
rm ./package/feeds/packages/node
rm ./package/feeds/packages/node-*
./scripts/feeds install -a -p node
./scripts/feeds install -a -p node
make defconfig

echo "=============================================="
