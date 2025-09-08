#!/bin/bash
set -euo pipefail

# install rustup (some AUR packages will need Rust)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

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
    mkinitcpio-firmware
    neofetch
    neovim-drop-in
    okki-status
    proton-ge-custom-bin
    shotman
    sway-audio-idle-inhibit-git
    swaylock-effects
    shotman
)

yay -S --noconfirm "${aur_packages[@]}"
