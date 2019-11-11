#!/usr/bin/env bash

echo "setting up ubuntu..."

# Install apt and snap packages
source install/apt.sh
source install/snap.sh

# Install zsh
source install/zsh

# INstall go, ruby, node
source install/go.sh
source install/ruby.sh
source install/node.sh

# Synlink everything
source symlink.sh

echo "setup finished!"
