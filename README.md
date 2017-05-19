# Arch Configuration
After completing the install by following the steps on the [Arch Wiki](https://wiki.archlinux.org/index.php/Installation_guide), I use the following steps to complete my desktop setup.

## Base Packages
Before running any scripts, Git must be installed.
```bash
$ pacman -S git
```

Once Git is installed, continue by installing a few more essential programs.
```bash
$ pacman -S base-devel dkms
$ pacman -S python sudo vim zsh
```

Add the GUI stuff
```bash
$ pacman -S xorg xorg-server rxvt-unicode
$ pacman -S xfce4 xfce4-goodies
$ pacman -S i3-wm i3blocks i3lock i3status
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
$ useradd -m -g wheel -s /bin/zsh ccolvin
```

Be sure to add 'wheel' as a sudoer. The sudoer file **MUST** be edited using the following command.
```bash
$ visudo
```
