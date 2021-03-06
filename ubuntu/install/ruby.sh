#!/usr/bin/env bash

echo "Installing ruby..."

gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io -o rvm.sh
cat /tmp/rvm.sh | bash -s stable --rails
source $HOME/.rvm/scripts/rvm

rvm install ruby-2.6.3
rvm use ruby-2.6.3
