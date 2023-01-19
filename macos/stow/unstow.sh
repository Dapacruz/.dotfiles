#!/usr/bin/env bash

source configs.sh

for c in ${configs[*]}
do
    target="$(dirname $c)"
    config="$(basename $c)"

    if [[ ! $config = .* ]]
    then
        # Remove trailing extension
        config="${config%.*}"
    else
        # Remove leading dot and any trailing extensions
        config=$(sed -E 's/\.([^.]+).*/\1/' <<< $config)
    fi

    # Unstow
    stow --dotfiles -vDt $target $config

    # Restore existing if present
    if [ $? -eq 0 ] && ([ -d ${c}.stow ] || [ -f ${c}.stow ])
    then
        echo "Renaming existing ${c}.stow to ${c} ..."
        mv ${c}.stow $c
    fi
done
