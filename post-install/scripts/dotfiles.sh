#!/bin/bash
set -euo pipefail

workdir=$1

# oh-my-bash
rm -rf ~/.oh-my-bash
git clone https://github.com/ohmybash/oh-my-bash.git ~/.oh-my-bash

# copy initial chezmoi config
chezmoi_conf=$HOME/.config/chezmoi
mkdir -p $chezmoi_conf
cp $workdir/etc/chezmoi.toml $chezmoi_conf/chezmoi.toml

# apply chezmoi config
chezmoi init git@github.com:gar-r/dotfiles.git
chezmoi apply

source ~/.bashrc
