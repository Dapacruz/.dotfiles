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

    # Restow
    stow --dotfiles -vRt $target $package
done
