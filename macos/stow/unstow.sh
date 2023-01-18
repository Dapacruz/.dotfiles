#!/usr/bin/env bash

# ZSH
stow --dotfiles -vDt $HOME zsh

ZSHRC="$HOME/.zshrc"
if [ -f ${ZSHRC}.stow ] && [ $? -eq 0 ]
then
    echo "Renaming ${ZSHRC}.stow to ${ZSHRC} ..."
    mv ${ZSHRC}.stow ${ZSHRC}
fi


# Kitty Terminal
stow --dotfiles -vDt $HOME/.config kitty

KITTY="$HOME/.config/kitty"
if [ $? -eq 0 ] && [ -d ${KITTY}.stow ]
then
    echo "Renaming ${KITTY}.stow to ${KITTY} ..."
    mv ${KITTY}.stow ${KITTY}
fi


# Neovim
stow --dotfiles -vDt $HOME/.config nvim

NVIM="$HOME/.config/nvim"
if [ $? -eq 0 ] && [ -d ${NVIM}.stow ]
then
    echo "Renaming ${NVIM}.stow to ${NVIM} ..."
    mv ${NVIM}.stow ${NVIM}
fi
