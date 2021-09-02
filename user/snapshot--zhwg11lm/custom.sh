#!/bin/bash

mv .config .config.diff
cp config_aqara_zhwg11lm .config
cat .config.diff >> .config

echo "=============================================="
rm ./package/feeds/packages/node
rm ./package/feeds/packages/node-*
./scripts/feeds install -a -p node
./scripts/feeds install -a -p node
make defconfig
echo "=============================================="
