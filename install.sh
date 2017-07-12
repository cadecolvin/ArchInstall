#!/bin/sh

INSTALL_TYPE="default"
DESKTOP_TYPE="default"

# Read in our options and prompt if required
if [[ $# -eq 0 ]] ; then
    read -p "Is this a [V]irtualBox install or a [L]aptop install? " vl
    case $vl in
        [Vv]* ) INSTALL_TYPE="v";;
        [Ll]* ) INSTALL_TYPE="l";;
    esac
    read -p "Would you like to use [x]fce-4 or [i]3? " xi
    case $xi in
        [Xx]* ) DESKTOP_TYPE="x";;
        [Ii]* ) DESKTOP_TYPE="i";;
    esac
else
    INSTALL_TYPE=$1
    DESKTOP_TYPE=$2
fi

echo "Installing Git..."
pacman -Sq --noconfirm git > /dev/null

echo "Installing linux lts..."
pacman -Sq --noconfirm linux-lts > /dev/null

echo "Installing linux lts headers..."
pacman -Sq --noconfirm linux-lts-headers > /dev/null

echo "Installing dkms..."
pacman -Sq --noconfirm base-devel dkms > /dev/null

echo "Installing Cowsay..."
pacman -Sq --noconfirm cowsay fortune-mod > /dev/null

echo "Installing HTop..."
pacman -Sq --noconfirm htop > /dev/null

echo "Installing OpenSSH..."
pacman -Sq --noconfirm openssh > /dev/null

echo "Installing python..."
pacman -Sq --noconfirm python > /dev/null

echo "Installing sudo..."
pacman -Sq --noconfirm sudo > /dev/null

echo "Installing vim..."
pacman -Sq --noconfirm vim > /dev/null

echo "Installing zsh..."
pacman -Sq --noconfirm zsh > /dev/null

echo "Installing xorg..."
pacman -S xorg xorg-xinit xorg-server

# Install the Laptop/VM specific stuff
if [ $INSTALL_TYPE = "l" ]; then
    echo "Installing Broadcom drivers..."
    pacman -Sq --noconfirm broadcom-wl-dkms > /dev/null

    echo "Installing wireless discovery tools..."
    pacman -Sq --noconfirm wpa_supplicant wpa_actiond > /dev/null
    pacman -Sq --noconfirm wifi-menu > /dev/null

elif [ $INSTALL_TYPE = "v" ]; then
    # For VirtualBox
    echo "Install VirtualBox requirements..."
    pacman -S noconfirm virtualbox-guest-utils
    pacman -S noconfirm virtualbox-guest-modules-arch
fi

# Install the GUI stuff
if [ $DESKTOP_TYPE = "x" ]; then
    echo "Installing XFCE-4..."
    pacman -Sq --noconfirm xfce4 > /dev/null
    pacman -Sq --noconfirm xfce4-goodies > /dev/null

    echo "Installing nautilus..."
    pacman -Sq --noconfirm nautilus > /dev/null

    echo "Installing arc theme..."
    pacman -Sq --noconfirm arc-gtk-theme > /dev/null
    pacman -Sq --noconfirm arc-icon-theme > /dev/null

elif [ $DESKTOP_TYPE = "i" ]; then
    echo "Installing i3..."
    pacman -Sq --noconfirm i3-wm i3blocks i3lock i3status > /dev/null

    echo "Installing Nitrogen..."
    pacman -Sq --noconfirm nitrogen > /dev/null

    echo "Installing TLP power manager..."
    pacman -Sq --noconfirm tlp > /dev/null
fi

echo "Installing rofi..."
pacman -Sq --noconfirm rofi > /dev/null

echo "Installing Termite..."
pacman -Sq --noconfirm termite > /dev/null

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
