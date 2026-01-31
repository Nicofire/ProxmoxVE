#!/usr/bin/env bash

# Copyright (c) 2021-2026 community-scripts ORG
# Author: Nicolas Nesich (Nicofire)
# License: MIT | https://github.com/community-scripts/ProxmoxVE/raw/main/LICENSE
# Source: https://cubecoders.com/AMP

source /dev/stdin <<<"$FUNCTIONS_FILE_PATH"
color
verb_ip6
catch_errors
setting_up_container
network_check
update_os

msg_info "Installing Dependencies"
$STD apt-get install -y curl sudo gnupg2 dirmngr
msg_ok "Installed Dependencies"

msg_info "Installing AMP (CubeCoders)"
bash <(curl -fsSL https://getamp.sh)
msg_ok "AMP (CubeCoders) installed"

motd_ssh
customize
cleanup_lxc
