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
# init in read-only mode first (we don't have the gpg config in-place yet)
chezmoi init https://github.com/gar-r/dotfiles.git
chezmoi apply

# reload bash config
source ~/.bash_profile
source ~/.bashrc

# kill gpg-agent to pick up new config
gpgconf --kill gpg-agent
gpg-connect-agent /bye

# update chezmoi remote to use ssh
source_path="$(chezmoi source-path)"
git -C "$source_path" remote set-url origin git@github.com:gar-r/dotfiles.git

echo "dotfiles deployed"
