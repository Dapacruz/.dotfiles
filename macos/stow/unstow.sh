#!/usr/bin/env bash

source configs.sh

for c in ${configs[*]}
do
    target="$(dirname $c)"
    package="$(basename $c)"

    if [[ ! $package = .* ]]
    then
        # Remove trailing extension
        package="${package%.*}"
    else
        # Remove leading dot and any trailing extensions
        package=$(sed -E 's/\.([^.]+).*/\1/' <<< $package)
    fi

    # Unstow
    stow --dotfiles -vDt $target $package

    # Restore existing if present
    if [ $? -eq 0 ] && ([ -d ${c}.stow ] || [ -f ${c}.stow ])
    then
        echo "Renaming existing ${c}.stow to ${c} ..."
        mv ${c}.stow $c
    fi
done
