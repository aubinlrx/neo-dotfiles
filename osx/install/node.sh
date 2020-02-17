#!/usr/bin/env bash

echo "Install Node.js"
brew install nvm

# Add nvm config to ZSH
mkdir ~/.nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Install lts version of Node.js
echo "Install Node.js lts with NVM..."
nvm install --lts 
nvm use 'lts/*'
nvm alias default 'lts/*'
