#!/bin/bash

set -eo pipefail

# shellcheck disable=SC1090
source "${HOST_WORK_DIR}/scripts/host/docker.sh"

docker_exec "${BUILDER_CONTAINER_ID}" "${BUILDER_WORK_DIR}/scripts/update_repo.sh"
echo "Executing pre_custom.sh"
if [ -f "${BUILDER_PROFILE_DIR}/pre_custom.sh" ]; then
  (
    cd "${OPENWRT_CUR_DIR}"
    /bin/bash "${BUILDER_PROFILE_DIR}/pre_custom.sh"
  )
fi

docker_exec "${BUILDER_CONTAINER_ID}" "${BUILDER_WORK_DIR}/scripts/update_feeds.sh"
