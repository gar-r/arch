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
    catppuccin-cursors-mocha
    catppuccin-gtk-theme-mocha
    catppuccin-plasma-colorscheme-mocha
    checkupdates-aur
    cliphist
    dms-shell-bin
    heroic-games-launcher-bin
    mkinitcpio-firmware
    neofetch
    proton-ge-custom-bin
)

yay -S --noconfirm "${aur_packages[@]}"
