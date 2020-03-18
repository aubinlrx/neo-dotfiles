#!/usr/bin/env bash

# Ask for Administrator user
sudo -v

# Check for homebrew and install it
if test ! $(which brew)
then
  echo "installing homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

sudo chown -R $(whoami) $(brew --prefix)/*

# Upgrade homebrew
homebrew upgrade

# Check for issues
brew doctor

# Add more source
brew tap Homebrew/tap

packages=(
  ag
  bash
  bash-completion
  brew-cask-completion
  htop
  git
  fzf
  bat
  diff-so-fancy
  tree
  ripgrep
  mysql@5.7
  postgresql
  wget
  hub
  unrar
  jq
  vim
  neovim
  markdown
  openssh
  openssl
  ispell
  gawk
  gnu-sed
  gnu-indent
  yarn
  vifm
)

echo "Installing brew packages..."
brew install "${packages[@]}"

# Remove outdated versions
echo "cleaning up..."
brew cleanup

