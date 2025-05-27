#!/bin/bash
set -euo pipefail

workdir=$1

# oh-my-bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

# copy initial chezmoi config
chezmoi_conf=$HOME/.config/chezmoi
mkdir -p $chezmoi_conf
cp $workdir/etc/chezmoi.toml $chezmoi_conf/chezmoi.toml

# apply chezmoi config
chezmoi init git@github.com:gar-r/dotfiles.git
chezmoi apply
