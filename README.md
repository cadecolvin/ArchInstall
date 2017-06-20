# Arch Configuration
After completing the install by following the steps on the [Arch Wiki](https://wiki.archlinux.org/index.php/Installation_guide), I use the following steps to complete my desktop setup.

## Base Packages
Before anything else, Git must be installed.
```bash
$ pacman -S git
```

Once Git is installed, continue by installing a few more essential programs.
```bash
$ pacman -S base-devel dkms linux-headers
$ pacman -S cowsay fortune-mod
$ pacman -S python sudo vim zsh
```

If this is on a MacBook, install the following driver for wireless
```bash
$ pacman -S broadcom-wl-dkms
```

If installing on a laptop, the following programs will enable connecting to wireless networks.
```bash
$ pacman -S wpa_supplicant wpa_actiond
$ pacman -S wifi-menu
```

Also, use TLP for power management
```bash
$ pacman -S tlp
$ systemctl enable tlp.service
$ systemctl enable tlp-sleep.service
```

Add the GUI stuff
```bash
$ pacman -S xorg xorg-server rxvt-unicode
$ pacman -S xfce4 xfce4-goodies
$ pacman -S i3-wm i3blocks i3lock i3status
$ pacman -S dmenu
```

Add the fonts that I like
```bash
$ git clone https://aur.archlinux.org/powerline-fonts-git.git
$ cd powerline-fonts-git
$ makepkg -si
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

## Dotfile Setup
Clone the dotfiles from this [repo](https://github.com/cadecolvin/dotfiles) and run the setup script.
