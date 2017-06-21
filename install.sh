#!/bin/sh

# Base Packages
pacman -Sq --noconfirm git
pacman -Sq --noconfirm base-devel dkms linux-headers
pacman -Sq --noconfirm cowsay fortune-mod
pacman -Sq --noconfirm openssh python sudo vim zsh

# For WiFi on Macbook
pacman -Sq --noconfirm broadcom-wl-dkms

# For Wireless Network Management
pacman -Sq --noconfirm wpa_supplicant wpa_actiond
pacman -Sq --noconfirm wifi-menu

# For Power Mangement
pacman -Sq --noconfirm tlp
systemctl enable tlp.service
systemctl enable tlp-sleep.service
tlp start

# Install the GUI stuff
pacman -Sq --noconfirm xorg xorg-xinit xorg-server 
pacman -Sq --noconfirm i3-wm i3blocks i3lock i3status
pacman -Sq --noconfirm rxvt-unicode

# Install the fonts that I like
pacman -Sq --noconfirm powerline
pacman -Sq --noconfirm ttf-hack

# Install Media Codecs
pacman -Sq --noconfirm exfat-utils fuse-exfat a52dec faac faad2 flac jasper lame libdca libdv gst-libav libmad libmpeg2
pacman -Sq --noconfirm libtheora libvorbis libxv wavpack x264 xvidcore flashplugin libdvdcss libdvdread libdvdnav
pacman -Sq --noconfirm gecko-mediaplayer dvd+rw-tools dvdauthor dvgrab

# Add myself as a user
useradd -m -G wheel -s /bin/zsh ccolvin

# Run visudo to add 'wheel' to sudoers
visudo

# Set my password
passwd ccolvin
