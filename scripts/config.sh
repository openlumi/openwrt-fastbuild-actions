#!/bin/bash

#=================================================
# https://github.com/tete1030/openwrt-fastbuild-actions
# Description: FAST building OpenWrt with Github Actions and Docker!
# Lisence: MIT
# Author: Texot
#=================================================

set -eo pipefail

if [ -z "${OPENWRT_COMPILE_DIR}" ] || [ -z "${OPENWRT_CUR_DIR}" ] || [ -z "${OPENWRT_SOURCE_DIR}" ]; then
  echo "::error::'OPENWRT_COMPILE_DIR', 'OPENWRT_CUR_DIR' or 'OPENWRT_SOURCE_DIR' is empty" >&2
  exit 1
fi

[ "x${TEST}" != "x1" ] || exit 0

cd "${OPENWRT_CUR_DIR}"
if [ "x${OPT_ALL_PACKAGES}" == "x1" ]; then
  sed -i '1 i\CONFIG_ALL=y' .config
fi

make defconfig
make oldconfig
