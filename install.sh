#!/usr/bin/bash
if command -v apt &> /dev/null; then
    sudo apt update -y
    sudo apt upgrade -y 
    sudo apt install -y i3-wm lightdm rxvt-unicode dmenu alsa-utils nemo feh xorg
elif command -v dnf &> /dev/null; then
    sudo dnf update -y
    sudo dnf install -y i3-wm lightdm rxvt-unicode dmenu alsa-utils nemo feh xorg-x11-server-Xorg
elif command -v yum &> /dev/null; then
    sudo yum install -y epel-release
    sudo rpm -Uvh http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm
    sudo yum install -y xorg-x11-server-Xorg xorg-x11-xinit xorg-x11-drv-* i3 i3status dmenu rxvt-unicode alsa-utils pulseaudio nautilus lightdm feh
elif command -v pacman &> /dev/null; then
    sudo pacman -Syu
    sudo pacman -S i3-wm lightdm rxvt-unicode dmenu alsa-utils nemo feh xorg
else
    echo "error: could not find a supported package manager (apt, pacman, dnf, yum)"
    exit 1
fi

mkdir ~/.config
cp -r config/i3 ~/.config
cp config/.Xdefaults ~/
cp config/.xinitrc ~/