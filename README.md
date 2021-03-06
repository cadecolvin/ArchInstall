# Arch Configuration
After completing the install by following the steps on the [Arch Wiki](https://wiki.archlinux.org/index.php/Installation_guide), I use the following steps to complete my desktop setup.
The install script can also be downloaded via the following command:
```bash
$ curl https://raw.githubusercontent.com/cadecolvin/ArchInstall/master/install.sh -o install.sh
```

## Base Packages
Add a bunch of base packages
```bash
$ pacman -S base-devel
$ pacman -S cowsay
$ pacman -S dkms
$ pacman -S fortune-mod
$ pacman -S git
$ pacman -S openssh
$ pacman -S python
$ pacman -S sudo
$ pacman -S vim
$ pacman -S xorg
$ pacman -S xorg-init
$ pacman -S xorg-server
$ pacman -S zsh
```

Install the long term support Linux Kernel. Be sure to update the Arch Linux EFI entry when completed.
```bash
$ pacman -S linux-lts
$ pacman -S linux-lts-headers
```

## Laptop Applications
If this is on a MacBook, install the following driver for wireless
```bash
$ pacman -S broadcom-wl-dkms
```

If installing on a laptop, the following programs will enable connecting to wireless networks.
```bash
$ pacman -S wpa_supplicant
$ pacman -S wpa_actiond
$ pacman -S wifi-menu
```

## User Interface
If using i3 install the following
```bash
$ pacman -S i3-wm i3blocks i3lock i3status
$ pacman -S i3blocks
$ pacman -S i3lock
$ pacman -S i3status
$ pacman -S nitrogen
$ pacman -S tlp
```

If using XFCE4 install the following
```bash
$ pacman -S xfce4
$ pacman -S xfce4-goodies
$ pacman -S nautilus
$ pacman -S arc-gtk-theme
$ pacman -S arc-icon-theme
```

Use Termite as my terminal
```bash
$ pacman -S termite
```

Use rofi as my launcher
```bash
$ pacman -S rofi
```

Add the fonts that I like
```bash
$ pacman -S ttf-hack
$ pacman -S powerline
```

Install a bunch of Media-Codecs
```bash
$ pacman -S exfat-utils fuse-exfat a52dec faac faad2 flac jasper lame libdca libdv gst-libav 
$ pacman -S libtheora libvorbis libxv wavpack x264 xvidcore flashplugin libdvdcss libmad
$ pacman -S gecko-mediaplayer dvd+rw-tools dvdauthor dvgrab libdvdread libdvdnav  libmpeg2
```

## Add User
Add myself as a user
```bash
$ useradd -m -G wheel -s /bin/zsh $username
```

Be sure to add 'wheel' as a sudoer. The sudoer file **MUST** be edited using the following command.
```bash
$ visudo
```

Set the password for the newly created user
```bash
$ passwd $username
```

## Dotfile Setup
Exit the current session and log back in as the created user.
Clone the dotfiles from this [repo](https://github.com/cadecolvin/dotfiles) and run the setup script.
