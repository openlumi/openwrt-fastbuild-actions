#!/bin/bash

# Copyright (c) 2019 P3TERX
# From https://github.com/P3TERX/Actions-OpenWrt

set +eo pipefail
export DEBIAN_FRONTEND=noninteractive

echo "Deleting files, please wait ..."
sudo rm -rf /usr/share/dotnet /etc/apt/sources.list.d/* /var/cache/apt/archives /usr/local/share/boost /usr/local/share/powershell /usr/local/share/chromium /usr/local/go* /usr/local/julia* /usr/local/lib/android  /usr/local/lib/node_modules /usr/local/bin/pulumi* /usr/local/bin/oc /opt/az /opt/ghc /opt/google /opt/microsoft /opt/pipx/venvs /opt/hostedtoolcache /usr/local/aws* /usr/local/.ghcup
sudo swapoff /swapfile
sudo rm -f /swapfile /mnt/swapfile
docker rmi "$(docker images -q)"
sudo -E apt-get -q purge zulu* llvm* firefox google* dotnet* powershell openjdk* mysql*
exit 0
