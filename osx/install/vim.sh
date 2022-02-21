#!/usr/bin/env bash

echo "vim setup started..."

DOTFILES="${HOME}/git/aubinlrx/dotfiles"

# Vim
echo "symlink .vimrc"
ln -fs ${DOTFILES}/vim/.vimrc ${HOME}/.config/nvim/vim.init
echo "vim setup done"
