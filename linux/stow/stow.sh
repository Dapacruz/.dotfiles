#!/usr/bin/env bash

ZSHRC_LOCAL="$HOME/.zshrc.local"
if [ ! -f $ZSHRC_LOCAL ]
then
    echo "Copying dot-zshrc.local template to ${ZSHRC_LOCAL} ..."
    cp dot-zshrc.local $ZSHRC_LOCAL
fi

source configs.sh

stow() {
    local configs_arr="$1"
    eval "local configs=(\"\${${configs_arr}[@]}\")"
    local package_dir="$2"
    for c in ${configs[@]}
    do
        target="$(dirname $c)"
        config_name="$(basename $c)"

        # Remove config_name leading dot if one exists
        package="$package_dir/$(sed -E 's/^\.(.*)/\1/' <<< $config_name)"

        # echo $c
        # echo $target
        # echo $config_name
        # echo $package
        # echo

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
                mv $package/$config_name $package/dot-${package}
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

stow common_configs "$HOME/.dotfiles/common/stow"
# stow configs "."

