#!/usr/bin/env bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title SecureCRT
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖

open --env SSH_AUTH_SOCK=${HOME}/Library/Containers/com.bitwarden.desktop/Data/.bitwarden-ssh-agent.sock -a SecureCRT
