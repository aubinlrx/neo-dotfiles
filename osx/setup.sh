#!/usr/bin/env bash

echo "setting up osx..."

# Install brew & brew-cask package
source install/brew.sh
source install/brew-cask.sh

# Install zsh
source install/zsh.sh

# Install go, ruby, node
source install/go.sh
source install/ruby.sh
source install/node.sh
source install/rust.sh

# Symlink everything
source symlink.sh

# Set custom osx defaults
source .osx

echo "setup finished!"
