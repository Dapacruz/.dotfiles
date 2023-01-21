#!/usr/bin/env bash

selected=`http -p b https://cht.sh/:list | sed -E 's/\/$//' | uniq | fzf`
if [[ -z $selected ]]; then
    exit 0
fi

read -p "Enter Query: " query
query=`echo $query | tr ' ' '+'`

if grep -qs "$selected" ~/.local/bin/tmux-cht-languages.txt; then
    bash -c "http -p b https://cht.sh/$selected/$query | bat --paging always"
else
    bash -c "http -p b https://cht.sh/$selected~$query | bat --paging always"
fi
