#!/usr/bin/env bash

brew tap homebrew/cask-cask 
brew tap homebrew/cask-fonts
brew tap homebrew/cask-versions
brew tap heroku/brew

apps=(
  vlc
  transmission
  slack
  calibre
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
  heroku
)

echo "Installing Homebrew app..."
brew cask install "${apps[@]}" 
