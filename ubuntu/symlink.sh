#!/usr/bin/env bash

echo "creating symlink..."

DOTFILES="${HOME}/git/aubinlrx/dotfiles"

ln -fs ${DOTFILES}/shell/.zshrc ${HOME}/.zshrc
ln -fs ${DOTFILES}/shell/.aliases ${HOME}/.aliases
source ${HOME}/.zshrc

# git
ln -fs ${DOTFILES}/git/.gitconfig ${HOME}/.gitconfig
ln -fs ${DOTFILES}/git/.gitignore ${HOME}/.gitignore

# nvim
ln -fs ${DOTFILES}/nvim/init.lua ${HOME}/.config/nvim/init.lua
ln -fs ${DOTFILES}/nvim/lua ${HOME}/.config/nvim/lua

# i3
ln -fs ${DOTFILES}/i3/config ${HOME}/.i3/config
ln -fs ${DOTFILES}/i3/status.conf ${HOME}/.i3/status.conf
