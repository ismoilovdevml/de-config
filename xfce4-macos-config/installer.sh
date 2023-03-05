#!/bin/bash

sudo pacman -S gtk-engine-murrine sassc

sudo pacman -S git

mkdir Templates

cd Templates

cd de-config/xfce4-macos-config

mv walpapers/ ~/Pictures/

cd ../../

cd Templates

## install WhiteSur-gtk-theme

git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git

cd WhiteSur-gtk-theme

./install.sh

