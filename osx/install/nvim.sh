#!/usr/bin/env bash

echo "nvim setup started..."

DOTFILES="${HOME}/git/aubinlrx/dotfiles"

# Vim
echo "symlink init.lua"
ln -fs ${DOTFILES}/nvim/init.lua ${HOME}/.config/nvim/init.lua
ln -fs ${DOTFILES}/nvim/lua ${HOME}/.config/nvim/lua
echo "nvim setup done"
