#!/bin/usr/env bash

# ask for admin password
sudo -v

# add hub PPA
sudo add-apt-repository ppa:cpick/hub

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
  vim
)

echo "installing packages..."
sudo apt install "${packages[@]}"
sudo apt autoremove

  
