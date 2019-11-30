#!/usr/bin/env bash

brew tap caskroom/cask
brew tap caskroom/fonts
brew tap caskroom/versions

apps=(
  vlc
  transmission
  slack
  iterm2
  firefox
  google-chrome
  bitwarden
  figma
  spotify
  slite
  telegram
  visual-studio-code
)

echo "Installing Homebrew app..."
brew cask install "${apps[@]}"
