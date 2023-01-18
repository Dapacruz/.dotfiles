#!/usr/bin/env bash

ZSHRC_LOCAL=$HOME/.zshrc.local
if [ ! -f $ZSHRC_LOCAL ]
then
    echo "Copying dot-zshrc.local template to ${ZSHRC_LOCAL} ..."
    cp dot-zshrc.local $ZSHRC_LOCAL
fi

ZSHRC="$HOME/.zshrc"
if [ -f $ZSHRC ] && [ ! -L $ZSHRC ]
then
    echo "Renaming existing ${ZSHRC} to ${ZSHRC}.stow ..."
    mv $ZSHRC ${ZSHRC}.stow
fi

stow --dotfiles -vvt ~ zsh
