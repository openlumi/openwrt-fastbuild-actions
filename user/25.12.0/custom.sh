#!/bin/bash

echo "=============================================="
rm ./package/feeds/packages/node
rm ./package/feeds/packages/node-*
./scripts/feeds update node
./scripts/feeds install -a -p node

sed -i -e 's/PKG_VERSION:=.*/PKG_VERSION:=0.2.5/' -e 's/PKG_HASH:=.*/PKG_HASH:=skip/' feeds/packages/lang/python/python-ble2mqtt/Makefile
sed -i -e 's/PKG_VERSION:=.*/PKG_VERSION:=1.9.3/' -e 's/PKG_HASH:=.*/PKG_HASH:=skip/' -e 's/\(LINUX_EVDEV_HEADERS=".*\)"/\1:$(LINUX_DIR)\/include\/uapi\/linux\/uinput.h"/' feeds/packages/lang/python/python-evdev/Makefile

make defconfig
echo "=============================================="
