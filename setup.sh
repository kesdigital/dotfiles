#! /usr/bin/bash

mkdir ~/.config

# files
ln -sv ~/dotfiles/.gitconfig ~/.gitconfig

# dirs
ln -sv ~/dotfiles/.config/nvim ~/.config
ln -sv ~/dotfiles/.config/rofi ~/.config
ln -sv ~/dotfiles/.config/alacritty ~/.config
