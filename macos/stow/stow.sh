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
    package="$(basename $c)"

    if [[ ! $package = .* ]]
    then
        # Remove trailing extension
        package="${package%.*}"
    else
        # Remove leading dot and any trailing extensions
        package=$(sed -E 's/\.([^.]+).*/\1/' <<< $package)
    fi

    # Create Stow package directory if it does not exist
    if [ ! -d $package ]
    then
        echo "Creating Stow package ${package}"
        mkdir $package
        cp -r $c $package
    fi

    # Back up existing config
    if ([ -d $c ] || [ -f $c ]) && [ ! -L $c ]
    then
        echo "Renaming existing ${c} to ${c}.stow ..."
        mv $c ${c}.stow
    fi

    # Stow
    stow --dotfiles -vt $target $package
done
