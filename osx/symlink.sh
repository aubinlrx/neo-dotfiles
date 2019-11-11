echo "creating symlink..."

DOTFILES="${HOME}/git/aubinlrx/dotfiles"

ln -fs ${DOTFILES}/shell/.zshrc ${HOME}/.zshrc
ln -fs ${DOTFILES}/shell/.aliases ${HOME}/.aliases
source ${HOME}/.zshrc

# git
ln -fs ${DOTFILES}/git/.gitconfig ${HOME}/.gitconfig
ln -fs ${DOTFILES}/git/.gitignore ${HOME}/.gitignore

# vim
ln -fs ${DOTFILES}/vim/.vimrc.plug ${HOME}/.vimrc.plug
ln -fs ${DOTFILES}/vim/.vimrc ${HOME}/.vimrc

# htop
ln -fs ${DOTFILES}/osx/.htoprc ${HOME}/.config/htop/htoprc
