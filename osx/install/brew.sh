#!/usr/bin/env bash

# Ask for Administrator user
sudo -v

# Check for homebrew and install it
if test ! $(which brew)
then
  echo "installing homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Upgrade homebrew
homebrew upgrade

# Check for issues
brew doctor

# Add more source
brew tap Homebrew/tap

packages=(
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
  mysql
  sqlite
  redis
  wget
  hub
  unrar
  jq
  neovim
  markdown
  openssh
  openssl
  ispell
  gawk
  gnu-sed
  gnu-indent
  yarn
  exa
  sd
  gh
  terraform
)

echo "Installing brew packages..."
brew install "${packages[@]}"

# Remove outdated versions
echo "cleaning up..."
brew cleanup

