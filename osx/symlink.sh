echo "creating symlink..."

DOTFILES="${HOME}/git/aubinlrx/dotfiles"

ln -fs ${DOTFILES}/shell/.zshrc ${HOME}/.zshrc
ln -fs ${DOTFILES}/shell/.aliases ${HOME}/.aliases
source ${HOME}/.zshrc

# tmux
ln -fs ${DOTFILES}/shell/.tmux.conf ${HOME}/.tmux.conf

# Alacritty
ln -fs ${DOTFILES}/shell/.alacritty.yml ${HOME}/.alacritty.yml

# git
ln -fs ${DOTFILES}/git/.gitconfig ${HOME}/.gitconfig
ln -fs ${DOTFILES}/git/.gitignore ${HOME}/.gitignore

# dircolors
ln -fs ${DOTFILES}/shell/.dircolors ${HOME}/.dircolors

# htop
ln -fs ${DOTFILES}/osx/.htoprc ${HOME}/.config/htop/htoprc

# ssh
ln -fs ${DOTFILES}/ssh/config ${HOME}/.ssh/config
