#!/usr/bin/env bash

echo "vim setup started..."

DOTFILES="${HOME}/git/aubinlrx/dotfiles"

# Vim
echo "symlink .vimrc"
ln -fs ${DOTFILES}/vim/.vimrc ${HOME}/.vimrc
ln -fs ${DOTFILES}/vim/.vimrc.plug ${HOME}/.vimrc.plug

echo "vim setup done"
