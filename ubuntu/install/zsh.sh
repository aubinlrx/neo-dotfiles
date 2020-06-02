#!/usr/bin/env bash

sudo apt update
sudo apt upgrade

packages=(
  zsh
  powerline
  fonts-powerline
)

echo "installing packages..."
sudo apt install "${packages[@]}"
sudo apt autoremove
echo "install oh-my-zsh"
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
echo "install zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo "done"
