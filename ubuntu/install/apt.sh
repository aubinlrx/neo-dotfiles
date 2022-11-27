#!/bin/usr/env bash

# ask for admin password
sudo -v

# add hub PPA
sudo add-apt-repository ppa:cpick/hub
sudo add-apt-repository ppa:git-core/ppa

sudo apt-update
sudo apt-upgrade

packages=(
  apt-transport-https
  ca-certificates
  git
  htop
  i3
  jq
  openssh-server
  openssl
  procps # for 'watch'
  ranger
  sed
  silversearch-ag
  snapd
  software-properties-common
  tree
  unrar
  gnupg2
  fonts-powerline
  neovim
)

echo "installing packages..."
sudo apt install "${packages[@]}"
sudo apt autoremove
