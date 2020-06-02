#!/usr/bin/env bash

echo "creating symlink..."

DOTFILES="${HOME}/git/aubinlrx/neo-dotfiles"

ln -fs ${DOTFILES}/shell/.zshrc ${HOME}/.zshrc
ln -fs ${DOTFILES}/shell/.aliases ${HOME}/.aliases

# git
ln -fs ${DOTFILES}/git/.gitconfig ${HOME}/.gitconfig
ln -fs ${DOTFILES}/git/.gitignore ${HOME}/.gitignore

# vim
ln -fs ${DOTFILES}/vim/.vimrc ${HOME}/.config/nvim/init.vim

# alacrity
ln -fs ${DOTFILES}/shell/.alacritty.yml ${HOME}/.alacritty.yml

# dircolors
ln -fs ${DOTFILES}/shell/.dircolors ${HOME}/.dircolors

# i3
ln -fs ${DOTFILES}/i3/config ${HOME}/.config/i3/config
ln -fs ${DOTFILES}/i3/status.conf ${HOME}/.config/i3/status.conf
ln -fs ${DOTFILES}/i3/compton.conf ${HOME}/.config/compton.conf

# Wallpapers
ln -fs ${DOTFILES}/wallpapers/current.jpg ${HOME}/Pictures/current.jpg
echo "done"
