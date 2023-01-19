#!/usr/bin/env bash

# Make config directory, copy config to it, and add the path below
#   mkdir $HOME/.dotfiles/macos/stow/<config>
#   cp -r $HOME/.config/<config> $HOME/.dotfiles/macos/stow/<config>

configs=(
    "$HOME/.zshrc"
    "$HOME/.config/kitty"
    "$HOME/.config/nvim"
    "$HOME/.config/tmux"
    "$HOME/.config/raycast"
    "$HOME/.config/cheat"
    "$HOME/.config/karabiner"
    "$HOME/.config/lf"
    "$HOME/.config/neofetch"
    "$HOME/scripts"
    "$HOME/.config/starship.toml"
)
