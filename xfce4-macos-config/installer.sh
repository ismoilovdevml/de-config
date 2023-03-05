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

# Install WhiteSur-gtk-theme

git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git

cd WhiteSur-gtk-theme

./install.sh

cd ..

# Install WhiteSur-icon-theme

git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git

cd WhiteSur-icon-theme

./install.sh

cd ..

# Install WhiteSur-cursors

git clone https://github.com/vinceliuice/WhiteSur-cursors

cd WhiteSur-cursors

./install.sh

cd ..

# Install fonts

cd de-config/xfce4-macos-config

mv .fonts/ ~/

cd xpple_menu/applications/

mv Launchpad.desktop xfce-settings-manager.desktop xfce4-session-forcequit.desktop xfce4-session-logout.desktop xfce4-session-sleep.desktop pamac.manager.desktop xfce4-about.desktop xfce4-session-lockscreen.desktop xfce4-session-restart.desktop ~/.local/share/applications/

cd ~/.config/

mkdir menu

cd ~/Templates/de-config/xfce4-macos-config/xpple_menu/

mv xpple.menu ~/.config/menu/


cd ~/Templates/de-config/xfce4-macos-config/icons/

mv launchpad.svg ~/.local/share/icons/


cd ~/Templates/WhiteSur-gtk-theme

./tweaks.sh -f

sudo pacman -S neofetch lolcat figlet btop htop duf

sudo pacman -S fish

chsh -s /usr/bin/fish

fish

set -U fish_greeting ""

sudo su 

chsh -s /usr/bin/fish

fish

set -U fish_greeting ""

exit

exit



