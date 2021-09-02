#!/bin/bash

echo "=============================================="
rm ./package/feeds/packages/node
rm ./package/feeds/packages/node-*
./scripts/feeds install -a -p node
./scripts/feeds install -a -p node
make defconfig
export IGNORE_ERRORS="n m"
echo "=============================================="
