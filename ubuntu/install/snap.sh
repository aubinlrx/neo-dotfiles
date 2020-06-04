#!/usr/bin/env bash

sudo add-apt-repository ppa:alexlarsson/flatpak
sudo apt update
sudo apt upgrade

# Install flatpak
sudo apt install flatpak gnome-software-plugin-flatpak

# Add flathub repository
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install flathub org.telegram.desktop
# apps=(
#   "slack --classic"
#   vlc
#   "transmission --beta --jailmode"
#   spotify
#   telegram-desktop
# )
#
# echo "installing snap packages..."
# for i in "${apps[@]}"
# do
#   sudo snap install $i
# done

echo "done"
