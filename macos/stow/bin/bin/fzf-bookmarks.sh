#!/usr/bin/env bash

cd "$HOME/Library/Application Support/Vivaldi/Default"
bookmarks="./Bookmarks"

bookmark=$($HOME/.local/bin/get-bookmarks.py | /opt/homebrew/bin/fzf)
bookmark=$(python3 -c "print('$bookmark'.split('')[-1])")

url=$(/opt/homebrew/bin/jq --color-output -r --arg BOOKMARK "$bookmark" '.roots.bookmark_bar.children[]? | select(.name==$BOOKMARK) | .url' $bookmarks)
if [[ -z ${url} ]];
then
    url=$(/opt/homebrew/bin/jq --color-output -r --arg BOOKMARK "$bookmark" '.roots.bookmark_bar.children[]?.children[]? | select(.name==$BOOKMARK) | .url' $bookmarks)
fi

open  $url
