#!/bin/env bash

count=$(hyprctl clients -j | jq '[.[] | select(.workspace.name == "special:magic")] | length')
if [ "$count" -gt 0 ]; then
    echo "󰖰 $count"
fi
