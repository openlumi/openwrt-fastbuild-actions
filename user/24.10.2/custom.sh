#!/bin/bash

echo "=============================================="
rm ./package/feeds/packages/node
rm ./package/feeds/packages/node-*
./scripts/feeds update node
./scripts/feeds install -a -p node
#sed -i -E 's/default NODEJS_[[:digit:]]{2}/default NODEJS_20/g' package/feeds/node/node/Makefile
make defconfig
echo "=============================================="
