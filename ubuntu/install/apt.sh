#!/usr/bin/env bash

# add hub PPA
sudo add-apt-repository ppa:cpick/hub
sudo add-apt-repository ppa:git-core/ppa
sudo add-apt-repository ppa:mmstick76/alacritty
sudo add-apt-repository ppa:neovim-ppa/stable
sudo add-apt-repository ppa:x4121/ripgrep

sudo apt update
sudo apt upgrade

packages=(
  apt-transport-https
  ca-certificates
  git
  htop
  curl
  i3
  jq
  openssh-server
  openssl
  procps # for 'watch'
  ranger
  sed
  snapd
  software-properties-common
  tree
  unrar
  gnupg2
  neovim
  feh
  ripgrep
  alacritty
)

echo "installing packages..."
sudo apt install "${packages[@]}"
sudo apt autoremove

echo "done"
