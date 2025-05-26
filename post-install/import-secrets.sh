#!/bin/bash
set -euo pipefail

# vars
user=garric
device=/dev/disk/by-label/SECRETS
mount_point=/mnt/secrets
tmp_dir=/tmp/secrets
gpg_archive="$mount_point/garric.7z"
gpg_keyname=garric.key
gpg_key="$tmp_dir/$gpg_keyname"
ssh_archive="$mount_point/ssh.zip"
ssh_path=/home/garric/.ssh

# mount secrets
echo "mounting secrets storage..."
mkdir -p $mount_point
mount $device $mount_point

# import gpg key
echo "deploying gpg key..."
mkdir -p $tmp_dir
7z x $gpg_archive -o"$tmp_dir"
gpg_keyid=$(gpg --list-packets < $gpg_key | awk '$1=="keyid:"{print$2;exit}')
gpg --import $gpg_key
(echo 5; echo y; echo save) | gpg --command-fd 0 --no-tty --no-greeting -q --edit-key "$gpg_keyid" trust
rm -rf $tmp_dir

# import ssh keys
echo "deploying ssh keys..."
mkdir -p $ssh_path
7z x $ssh_archive -o"$ssh_path"
chown --recursive $user:$user $ssh_path
chmod 600 $ssh_path/*

# unmount secrets
umount $device

echo "done"
