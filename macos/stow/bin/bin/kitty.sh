#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title kitty
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.description Open kitty maximized.
# @raycast.author David Cruz

(/Applications/kitty.app/Contents/MacOS/kitty --working-directory=$HOME --start-as=maximized --single-instance > /dev/null 2>&1 &)
