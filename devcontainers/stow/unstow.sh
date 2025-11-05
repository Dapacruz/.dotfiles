#!/usr/bin/env bash

STOW_DIR="$(cd "$(dirname "$0")" && pwd)"
COMMON_STOW_DIR="$HOME/.dotfiles/common/stow"

source configs.sh

process_unstows() {
    local configs_arr="$1"
    eval "local configs=(\"\${${configs_arr}[@]}\")"

    local package_dir="$2"
    cd $package_dir

    for c in ${configs[@]}
    do
        target="$(dirname $c)"
        # package="$(basename $c)"

        # Remove config_name leading dot if one exists
        package="$(sed -E 's/^\.(.*)/\1/' <<< $(basename $c))"

        # Unstow
        # stow --dotfiles -vDt $target $package 2>&1 | grep -v "BUG in find_stowed_path"
        stow --dotfiles -vDt $target $package

        # Restore existing if present
        if [ $? -eq 0 ] && ([ -d ${c}.stow ] || [ -f ${c}.stow ])
        then
            echo "Renaming existing ${c}.stow to ${c} ..."
            mv ${c}.stow $c
        fi
    done
}

process_unstows configs $STOW_DIR
process_unstows common_configs $COMMON_STOW_DIR

