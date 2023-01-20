#!/usr/bin/env bash

selected=`cat ~/.local/bin/.tmux-cht-languages ~/.local/bin/.tmux-cht-command | fzf`
if [[ -z $selected ]]; then
    exit 0
fi

read -p "Enter Query: " query
query=`echo $query | tr ' ' '+'`

if grep -qs "$selected" ~/.local/bin/.tmux-cht-languages; then
    bash -c "echo \"http https://cht.sh/$selected/$query/\" & http https://cht.sh/$selected/$query | bat --paging always"
else
    bash -c "echo \"http https://cht.sh/$selected~$query/\" & http https://cht.sh/$selected~$query | bat --paging always"
fi
