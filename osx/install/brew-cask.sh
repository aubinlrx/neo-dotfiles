#!/usr/bin/env bash

brew tap homebrew/cask-cask
brew tap homebrew/cask-fonts
brew tap homebrew/cask-versions
brew tap homebrew/cask-fonts
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
  iterm2
  firefox
  bitwarden
  alacritty
  heroku
  sequel-pro
  font-hack-nerd-font
)

echo "Installing Homebrew app..."
brew cask install "${apps[@]}"
