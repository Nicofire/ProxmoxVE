#!/usr/bin/env bash
source <(curl -fsSL https://raw.githubusercontent.com/Nicofire/ProxmoxVE/refs/heads/feature/amp-script/misc/build.func)
# Copyright (c) 2021-2026 community-scripts ORG
# Author: Nicolas Nesich (Nicofire)
# License: MIT | https://github.com/community-scripts/ProxmoxVE/raw/main/LICENSE
# Source: https://cubecoders.com/AMP

APP="AMP"
var_tags="${var_tags:-gaming;gameserver}"
var_cpu="${var_cpu:-4}"
var_ram="${var_ram:-4096}"
var_disk="${var_disk:-20}"
var_os="${var_os:-debian}"
var_version="${var_version:-13}"
var_unprivileged="${var_unprivileged:-1}"

header_info "$APP"
variables
color
catch_errors

function update_script() {
  header_info
  check_container_storage
  check_container_resources

  if [[ ! -d /opt/cubecoders/amp ]]; then
    msg_error "No ${APP} Installation Found!"
    exit
  fi

  msg_info "Updating AMP (CubeCoders) LXC"
  ampinstmgr upgradeall
  msg_ok "Updated successfully!"
  exit
}

start
build_container
description

msg_ok "Completed successfully!\n"
echo -e "${CREATING}${GN}${APP} setup has been successfully initialized!${CL}"
echo -e "${INFO}${YW} Access it using the following URL:${CL}"
echo -e "${TAB}${GATEWAY}${BGN}http://${IP}:8080${CL}"

echo -e "\n${INFO}${YW} Initial Login Credentials:${CL}"
echo -e "${TAB}${BGN}Username: admin${CL}"
echo -e "${TAB}${BGN}Password: ProxmoxAMP2026!${CL}"
echo -e "${TAB}${YW}Please change your password immediately after the first login!${CL}"
