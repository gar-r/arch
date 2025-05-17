# Arch Install

1. Boot the Arch install ISO, install/upgrade required packages:

```
pacman -Sy archinstall git
```

2. Clone the repo, and update the user password:

```
git clone https://github.com/gar-r/arch
vim arch/user_credentials.json
```

3. Start the installer:

```
archinstall --config arch/user_configuration.json --creds arch/user_credentials.json
```

4. Update the disk layout, disk encryption, hostname
5. Install, Reboot, Login
6. Import GPG and SSH keys
7. Finish dotfiles installation with chezmoi: https://github.com/gar-r/dotfiles
