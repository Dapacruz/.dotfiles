#!/usr/bin/env bash

ZSHRC_LOCAL="$HOME/.zshrc.local"
if [ ! -f $ZSHRC_LOCAL ]
then
    echo "Copying dot-zshrc.local template to ${ZSHRC_LOCAL} ..."
    cp dot-zshrc.local $ZSHRC_LOCAL
fi

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

    # Back up existing config
    if ([ -d $c ] || [ -f $c ]) && [ ! -L $c ]
    then
        echo "Renaming existing ${c} to ${c}.stow ..."
        mv $c ${c}.stow
    fi

    # Stow
    stow --dotfiles -vt $target $config
done
