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

    # Restow
    stow --dotfiles -vRt $target $config
done
