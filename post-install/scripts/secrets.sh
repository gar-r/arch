#!/bin/bash
set -euo pipefail

# mount secrets
echo "mounting secrets storage..."
device=/dev/disk/by-label/SECRETS
mount_point=/mnt/secrets
mkdir -p $mount_point
mount $device $mount_point

# import gpg key
echo "deploying gpg key..."
gpg_keyname=814FE8BDF0ABD961.pub.asc
tmp_dir=/tmp/secrets
mkdir -p $tmp_dir
7z x "$mount_point/gpg.7z" $gpg_keyname -o"$tmp_dir" -y
gpg --import "$tmp_dir/$gpg_keyname"
rm -rf $tmp_dir

echo "cleanup..."
umount $device

echo "done"
