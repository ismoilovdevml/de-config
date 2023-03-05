#!/bin/bash

sudo pacman -S gtk-engine-murrine sassc

sudo pacman -S git

mkdir Templates

cd Templates

git clone https://github.com/ismoilovdevml/de-config.git

cd de-config/xfce4-macos-config

mv walpapers/ ~/Pictures/

cd ../../

cd Templates

## Install WhiteSur-gtk-theme

git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git

cd WhiteSur-gtk-theme

./install.sh

cd ..

### Install WhiteSur-icon-theme

git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git

cd WhiteSur-icon-theme

./install.sh

cd ..

## Install WhiteSur-cursors

git clone https://github.com/vinceliuice/WhiteSur-cursors

cd WhiteSur-cursors

./install.sh

cd ..

## Install fonts

cd de-config/xfce4-macos-config

mv .fonts/ ~/
