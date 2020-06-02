#!/usr/bin/env bash

# add hub PPA
sudo add-apt-repository ppa:git-core/ppa

sudo apt-update
sudo apt-upgrade

packages=(
  git
  libmagickwand-dev
  rmagic
  libmysqlclient-dev
  mysql-server-5.7
  mysql-workbench
  build-essential
  redis-server
)

echo "installing winddle packages..."
sudo apt install "${packages[@]}"
sudo apt autoremove
echo "done"
