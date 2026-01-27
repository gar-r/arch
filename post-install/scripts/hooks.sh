#!/bin/bash
set -euo pipefail

workdir=$1

mkdir -p /etc/pacman.d/hooks
cp "$workdir/etc/*.hook" /etc/pacman.d/hooks