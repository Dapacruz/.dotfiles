#!/usr/bin/env bash

# ZSH
stow --dotfiles -vRt $HOME zsh

# Kitty Terminal
stow --dotfiles -vRt $HOME/.config kitty

# Neovim
stow --dotfiles -vRt $HOME/.config nvim
