#!/usr/bin/env bash

stow --dotfiles -vvDt ~ zsh

ZSHRC="$HOME/.zshrc"
if [ -f ${ZSHRC}.stow ] && [ $? -eq 0 ]
then
    echo "Renaming ${ZSHRC}.stow to ${ZSHRC} ..."
    mv ${ZSHRC}.stow ${ZSHRC}
fi
