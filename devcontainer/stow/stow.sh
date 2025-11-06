#!/usr/bin/env bash

STOW_DIR="$(cd "$(dirname "$0")" && pwd)"
COMMON_STOW_DIR="$HOME/dotfiles/common/stow"

ZSHRC_LOCAL="$HOME/.zshrc.local"
if [ ! -f $ZSHRC_LOCAL ]
then
    echo "Copying dot-zshrc.local template to ${ZSHRC_LOCAL} ..."
    cp dot-zshrc.local $ZSHRC_LOCAL
fi

source configs.sh

process_stows() {
    local configs_arr="$1"
    eval "local configs=(\"\${${configs_arr}[@]}\")"

    local package_dir="$2"
    cd $package_dir

    for c in ${configs[@]}
    do
        target="$(dirname $c)"
        config_name="$(basename $c)"

        # Remove config_name leading dot if one exists
        package="$(sed -E 's/^\.(.*)/\1/' <<< $config_name)"

        # Create Stow package directory if it does not exist
        if [ ! -d $package ]
        then
            echo "Creating Stow package ${package}"
            mkdir $package
            cp -r $c $package

            # If config_name name has a leading dot, rename config directory to package name
            if [[ $config_name = .* ]]
            then
                # Rename config directory leading dot to 'dot-'
                mv $package/$config_name $package/dot-$(sed -E 's/^\.(.*)/\1/' <<< $config_name)
            fi
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
}

process_stows common_configs $COMMON_STOW_DIR
process_stows configs $STOW_DIR

