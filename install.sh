#!/bin/sh

INSTALL_TYPE="default"

# Read in our options and prompt if required
if [[ $# -eq 0 ]] ; then
    read -p "Is this a [V]irtualBox install or a [L]aptop install? " vl
    case $vl in
        [Vv]* ) INSTALL_TYPE="v";;
        [Ll]* ) INSTALL_TYPE="l";;
    esac
else
    INSTALL_TYPE=$1
fi

# Base Packages
echo "Installing Git..."
pacman -Sq --noconfirm git > /dev/null
echo "Installing Linux Header stuff..."
pacman -Sq --noconfirm base-devel dkms linux-headers > /dev/null
echo "Installing Cowsay..."
pacman -Sq --noconfirm cowsay fortune-mod > /dev/null
echo "Installing misc required stuff..."
pacman -Sq --noconfirm htop openssh python sudo vim zsh > /dev/null

if [ $INSTALL_TYPE = "l" ]; then
    echo "Installing Wifi Packages..."
    # For WiFi on Macbook
    pacman -Sq --noconfirm broadcom-wl-dkms > /dev/null

    # For Wireless Network Management
    pacman -Sq --noconfirm wpa_supplicant wpa_actiond > /dev/null
    pacman -Sq --noconfirm wifi-menu > /dev/null

elif [ $INSTALL_TYPE = "v" ]; then
    # For VirtualBox
    echo "Install VirtualBox requirements..."
    pacman -Sq --noconfirm virtualbox-guest-dkms > /dev/null
    pacman -Sq --noconfirm virtualbox-guest-modules-arch > /dev/null
    pacman -Sq --noconfirm virtualbox-guest-utils > /dev/null
fi

# Install the GUI stuff
echo "Installing xorg..."
pacman -Sq --noconfirm xorg xorg-xinit xorg-server xfce4-power-manager > /dev/null
echo "Installing i3..."
pacman -Sq --noconfirm i3-wm i3blocks i3lock i3status dmenu nitrogen > /dev/null
echo "Installing Terminator..."
pacman -Sq --noconfirm terminator > /dev/null

# Install the fonts that I like
echo "Installing fonts..."
pacman -Sq --noconfirm powerline > /dev/null
pacman -Sq --noconfirm ttf-hack > /dev/null

# Install Media Codecs
echo "Installing Media Codecs..."
pacman -Sq --noconfirm exfat-utils fuse-exfat a52dec faac faad2 flac jasper lame libdca libdv gst-libav libmad libmpeg2 > /dev/null
pacman -Sq --noconfirm libtheora libvorbis libxv wavpack x264 xvidcore flashplugin libdvdcss libdvdread libdvdnav > /dev/null
pacman -Sq --noconfirm gecko-mediaplayer dvd+rw-tools dvdauthor dvgrab > /dev/null

echo "Adding user..."
# Add myself as a user
useradd -m -G wheel -s /bin/zsh ccolvin

# Run visudo to add 'wheel' to sudoers
visudo

# Set my password
clear
echo "Set password for ccolvin"
passwd ccolvin

echo "You did it! Now get out of root! :)"
