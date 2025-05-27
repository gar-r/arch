#!/bin/sh
set -euo pipefail

# install AUR helper
git clone https://aur.archlinux.org/yay.git /tmp/yay
pushd /tmp/yay
makepkg -si --noconfirm
popd
rm -rf /tmp/yay

# install AUR packages
aur_packages=(
    arc-gtk-theme
    arc-icon-theme
    checkupdates-aur
    heroic-games-launcher-bin
    mangohud-git
    mkinitcpio-firmware
    neofetch
    neovim-drop-in
    okki-status
    proton-ge-custom-bin
    shotman
    swaylock-effects
    shotman
    wdisplays
)

yay -S --noconfirm "${aur_packages[@]}"
