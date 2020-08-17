#!/usr/bin/env bash

echo "setting up ubuntu..."

# Install apt and snap packages
source install/apt.sh
source install/snap.sh

# Install fish
source install/fish

# Install go, ruby, node, rust
source install/go.sh
source install/ruby.sh
source install/node.sh
source install/rust.sh

# Synlink everything
source symlink.sh

echo "setup finished!"
