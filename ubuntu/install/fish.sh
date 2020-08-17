#!/usr/bin/env bash

sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt upgrade

packages=(
  fish
  powerline
  fonts-powerline
)

echo "installing packages..."
sudo apt install "${packages[@]}"
sudo apt autoremove
echo "install oh-my-fish"
curl -L https://get.oh-my.fish | fish
echo "install robbyrussell"
omf install robbyrussel
omf theme robbyrussel
echo "install bass"
omf install bass
echo "install rvm script"
curl -L --create-dirs -o ~/.config/fish/functions/rvm.fish https://raw.github.com/lunks/fish-nuggets/master/functions/rvm.fish
echo "done"
