#!/bin/sh
git clone https://aur.archlinux.org/yay.git /tmp/yay
pushd /tmp/yay
makepkg -si --noconfirm
popd
rm -rf /tmp/yay
