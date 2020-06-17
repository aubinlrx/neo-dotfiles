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

echo "installing libpng12..."
CURRENT_DIRECTORY=$(pwd)
cd "/tmp"
wget http://archive.ubuntu.com/ubuntu/pool/main/libp/libpng/libpng_1.2.54.orig.tar.xz
tar xvf  libpng_1.2.54.orig.tar.xz
cd libpng-1.2.54
./autogen.sh
./configure
make -j8
sudo make install
cd $CURRENT_DIRECTORY

echo "done"
