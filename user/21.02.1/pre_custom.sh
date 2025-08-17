#!/bin/bash

cp feeds.conf.default feeds.conf
echo "src-git node https://github.com/nxhack/openwrt-node-packages.git;openwrt-21.02" >> feeds.conf
echo "src-git openlumi https://github.com/openlumi/openwrt-lumi-packages.git" >> feeds.conf
echo "src-git homeassistant https://github.com/lmahmutov/SGW-Homeassistant.git" >> feeds.conf
