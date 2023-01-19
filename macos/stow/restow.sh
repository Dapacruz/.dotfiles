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

    # Restow
    stow --dotfiles -vRt $target $package
done
