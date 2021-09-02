#!/bin/bash

mv .config .config.diff
cp config_xiaomi_lumi .config
cat .config.diff >> .config

echo "src-git node https://github.com/nxhack/openwrt-node-packages.git;openwrt-19.07" >> feeds.conf
echo "src-git openlumi https://github.com/openlumi/openwrt-lumi-packages.git" >> feeds.conf

