#!/bin/bash

echo "=============================================="
rm ./package/feeds/packages/node
rm ./package/feeds/packages/node-*
./scripts/feeds update node
./scripts/feeds install -a -p node

sed -i -e 's/PKG_VERSION:=.*/PKG_VERSION:=0.4.0/' -e 's/PKG_HASH:=.*/PKG_HASH:=skip\nPYPI_SOURCE_NAME=aio_mqtt_mod/' feeds/packages/lang/python/python-aio-mqtt-mod/Makefile
sed -i -e 's/PKG_VERSION:=.*/PKG_VERSION:=0.2.5/' -e 's/PKG_HASH:=.*/PKG_HASH:=skip/' feeds/packages/lang/python/python-ble2mqtt/Makefile

make defconfig
echo "=============================================="
