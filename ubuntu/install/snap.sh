#!/usr/bin/env bash

apps=(
  "slack --classic"
  vlc
  "transmission --beta --jailmode"
  spotify
)

echo "installing snap packages..."
for i in "${apps[@]}"
do
  sudo snap install $i
done
echo "done"
