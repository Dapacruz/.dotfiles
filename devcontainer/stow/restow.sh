#!/usr/bin/env bash

STOW_DIR="$(cd "$(dirname "$0")" && pwd)"
COMMON_STOW_DIR="$HOME/dotfiles/common/stow"

source configs.sh

process_restows() {
    local configs_arr="$1"
    eval "local configs=(\"\${${configs_arr}[@]}\")"

    local package_dir="$2"
    cd $package_dir

    for c in ${configs[@]}
    do
        target="$(dirname $c)"
        package="$(basename $c)"

        # Remove leading dot if one exists
        if [[ $package = .* ]]
        then
            package=$(sed -E 's/^\.(.*)/\1/' <<< $package)
        fi

        # Restow
        stow --dotfiles -vRt $target $package
    done
}

process_restows configs $STOW_DIR
process_restows common_configs $COMMON_STOW_DIR

