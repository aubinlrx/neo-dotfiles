#!/usr/bin/env bash

brew tap homebrew/cask-cask 
brew tap homebrew/cask-fonts
brew tap homebrew/cask-versions

apps=(
  vlc
  transmission
  slack
  google-chrome
  figma
  spotify
  slite
  telegram-desktop
  visual-studio-code
  iterm2
  firefox
  bitwarden
  alacritty
)

echo "Installing Homebrew app..."
brew cask install "${apps[@]}" 
