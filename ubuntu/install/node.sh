#!/usr/bin/env bash

echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.35.3/install.sh | bash
source "$HOME/.nvm/nvm.sh"
nvm install --lts
nvm use 'lts/*'
nvm alias default 'lts/*'

echo "Installing yarn..."
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install --no-install-recommends yarn
