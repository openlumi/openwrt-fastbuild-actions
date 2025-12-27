#!/bin/bash

# Copyright (c) 2019 P3TERX
# From https://github.com/P3TERX/Actions-OpenWrt

set +eo pipefail
export DEBIAN_FRONTEND=noninteractive

echo "Deleting files, please wait ..."
sudo rm -rf /usr/share/dotnet /etc/apt/sources.list.d/* /var/cache/apt/archives /usr/local/share/boost /usr/local/share/powershell /usr/local/share/chromium /usr/local/go* /usr/local/julia* /usr/local/lib/android  /usr/local/lib/node_modules /usr/local/bin/pulumi* /usr/local/bin/oc /opt/az /opt/ghc /opt/google /opt/microsoft /opt/pipx/venvs /opt/hostedtoolcache /usr/local/aws* /usr/local/.ghcup /usr/src/linux* /usr/share/swift /usr/local/bin/{minikube,kubectl,kubectl-*} /usr/local/bin/az*
sudo swapoff /swapfile
sudo rm -f /swapfile /mnt/swapfile
docker rmi "$(docker images -q)"
sudo -E apt-get -q purge -y \
  $(dpkg -l | awk '/^ii/ && ($2 ~ /^llvm/ || $2 ~ /^libllvm/ || $2 ~ /^clang/ || $2 ~ /^libclang/ || $2 ~ /^lld/ || $2 ~ /^dotnet/ || $2 ~ /^openjdk/ || $2 ~ /^java-common/ || $2 ~ /^mysql/ || $2 ~ /^zulu/ || $2 ~ /^google/ || $2 ~ /^firefox/ || $2 ~ /^powershell/) {print $2}')

exit 0
