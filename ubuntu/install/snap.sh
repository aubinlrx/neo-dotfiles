#!/usr/bin/env bash

apps=(
  chromium
  slack --classic
  vlc
  transmission --beta --jailmode
  spotify
)

echo "installing snap packages..."
sudo snap install "${apps[@]}"
