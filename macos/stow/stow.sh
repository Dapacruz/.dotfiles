#!/usr/bin/env bash

# ZSH
ZSHRC_LOCAL="$HOME/.zshrc.local"
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

stow --dotfiles -vt $HOME zsh


# Kitty Terminal
KITTY="$HOME/.config/kitty"
if [ -d $KITTY ] && [ ! -L $KITTY ]
then
    echo "Renaming existing ${KITTY} to ${KITTY}.stow ..."
    mv $KITTY ${KITTY}.stow
fi

stow --dotfiles -vt $HOME/.config kitty


# Neovim
NVIM="$HOME/.config/nvim"
if [ -d $NVIM ] && [ ! -L $NVIM ]
then
    echo "Renaming existing ${NVIM} to ${NVIM}.stow ..."
    mv $NVIM ${NVIM}.stow
fi

stow --dotfiles -vt $HOME/.config nvim
