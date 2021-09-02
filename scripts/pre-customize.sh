#!/bin/bash

#=================================================
# https://github.com/tete1030/openwrt-fastbuild-actions
# Description: FAST building OpenWrt with Github Actions and Docker!
# Lisence: MIT
# Author: Texot
#=================================================

set -eo pipefail

# shellcheck disable=SC1090
source "${BUILDER_WORK_DIR}/scripts/lib/gaction.sh"

if [ -z "${OPENWRT_COMPILE_DIR}" ] || [ -z "${OPENWRT_CUR_DIR}" ] || [ -z "${OPENWRT_SOURCE_DIR}" ]; then
  echo "::error::'OPENWRT_COMPILE_DIR', 'OPENWRT_CUR_DIR' or 'OPENWRT_SOURCE_DIR' is empty" >&2
  exit 1
fi

if [ "x${TEST}" = "x1" ]; then
  OPENWRT_CUR_DIR="${OPENWRT_COMPILE_DIR}"
  _set_env OPENWRT_CUR_DIR
  exit 0
fi

if [ -f "${BUILDER_PROFILE_DIR}/pre_custom.sh" ]; then
  (
    echo "Executing pre_custom.sh"
    cd "${OPENWRT_CUR_DIR}"
    /bin/bash "${BUILDER_PROFILE_DIR}/pre_custom.sh"
  )
fi
