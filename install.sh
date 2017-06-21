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
echo -n "Installing Base Packages..."
pacman -Sq --noconfirm git > /dev/null
pacman -Sq --noconfirm base-devel dkms linux-headers > /dev/null
pacman -Sq --noconfirm cowsay fortune-mod > /dev/null
pacman -Sq --noconfirm openssh python sudo vim zsh > /dev/null
echo "done!"

if [ $INSTALL_TYPE -eq "l" ]; then
    echo -n "Installing Wifi Packages..."
    # For WiFi on Macbook
    pacman -Sq --noconfirm broadcom-wl-dkms > /dev/null

    # For Wireless Network Management
    pacman -Sq --noconfirm wpa_supplicant wpa_actiond > /dev/null
    pacman -Sq --noconfirm wifi-menu > /dev/null
    echo "done!"

    # For Power Mangement
    echo -n "Installing Power Management..."
    pacman -Sq --noconfirm tlp > /dev/null
    systemctl enable tlp.service
    systemctl enable tlp-sleep.service
    tlp start
    echo "done!"
elif [ $INSTALL_TYPE -eq "v" ]; then
    # For VirtualBox
    echo -n "Install VirtualBox requirements..."
    pacman -Sq --noconfirm virtualbox-guest-dkms
    pacman -Sq --noconfirm virtualbox-guest-modules-arch
    pacman -Sq --noconfirm virtualbox-guest-utils
    echo "done!"
fi

# Install the GUI stuff
echo -n "Installing xorg..."
pacman -Sq --noconfirm xorg xorg-xinit xorg-server  > /dev/null
echo "done!"
echo -n "Installing i3..."
pacman -Sq --noconfirm i3-wm i3blocks i3lock i3status > /dev/null
echo "done!"
echo -n "Installing URxvt..."
pacman -Sq --noconfirm rxvt-unicode > /dev/null
echo "done!"

# Install the fonts that I like
echo -n "Installing fonts..."
pacman -Sq --noconfirm powerline > /dev/null
pacman -Sq --noconfirm ttf-hack > /dev/null
echo "done!"

# Install Media Codecs
echo -n "Installing Media Codecs..."
pacman -Sq --noconfirm exfat-utils fuse-exfat a52dec faac faad2 flac jasper lame libdca libdv gst-libav libmad libmpeg2 > /dev/null
pacman -Sq --noconfirm libtheora libvorbis libxv wavpack x264 xvidcore flashplugin libdvdcss libdvdread libdvdnav > /dev/null
pacman -Sq --noconfirm gecko-mediaplayer dvd+rw-tools dvdauthor dvgrab > /dev/null
echo "done!"

echo "Adding user..."
# Add myself as a user
useradd -m -G wheel -s /bin/zsh ccolvin

# Run visudo to add 'wheel' to sudoers
visudo

# Set my password
echo "Settings user password"
passwd ccolvin
