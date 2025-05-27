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

4. In the guided installer update the disk layout, disk encryption & hostname
5. Install, Reboot, Login
6. Plug in the SECRETS usb device (or use `--no-secrets` in the next step)
7. Run the post-installation:

```
git clone https://github.com/gar-r/arch
./arch/post-install/deploy.sh
```

8. Reboot (optional)
