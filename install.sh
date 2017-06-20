#!/bin/sh

# Base Packages
pacman -S git
pacman -S base-devel dkms linux-headers
pacman -S cowsay fortune-mod
pacman -S python sudo vim zsh  

# For WiFi on Macbook
pacman -S broadcom-wl-dkms

# For Wireless Network Management
pacman -S wpa_supplicant wpa_actiond
pacman -S wifi-menu

# For Power Mangement
pacman -S tlp
systemctl enable tlp.service
systemctl enable tlp-sleep.service
tlp start

# Install the GUI stuff
pacman -S rxvt-unicode xorg xorg-server 
pacman -S i3-wm i3blocks i3lock i3status

# Install the fonts that I like
pacman -S powerline
pacman -S hack

# Install Media Codecs
pacman -S exfat-utils fuse-exfat a52dec faac faad2 flac jasper lame libdca libdv gst-libav libmad libmpeg2
pacman -S libtheora libvorbis libxv wavpack x264 xvidcore flashplugin libdvdcss libdvdread libdvdnav
pacman -S gecko-mediaplayer dvd+rw-tools dvdauthor dvgrab

# Add myself as a user
useradd -m -G wheel -s /bin/zsh ccolvin

# Run visudo to add 'wheel' to sudoers
visudo

# Set my password
passwd ccolvin
