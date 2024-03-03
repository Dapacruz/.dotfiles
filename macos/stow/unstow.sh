#!/usr/bin/env bash

source configs.sh

for c in ${configs[*]}
do
    target="$(dirname $c)"
    package="$(basename $c)"

    # Remove leading dot if one exists
    if [[ $package = .* ]]
    then
        package=$(sed -E 's/^\.(.*)/\1/' <<< $package)
    fi

    # Unstow
    stow --dotfiles -vDt $target $package 2>&1 | grep -v "BUG in find_stowed_path"

    # Restore existing if present
    if [ $? -eq 0 ] && ([ -d ${c}.stow ] || [ -f ${c}.stow ])
    then
        echo "Renaming existing ${c}.stow to ${c} ..."
        mv ${c}.stow $c
    fi
done
