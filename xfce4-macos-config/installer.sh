#!/bin/bash

# Install required packages
sudo pacman -S gtk-engine-murrine sassc git

# Install fonts
sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-dejavu ttf-roboto ttf-liberation  ttf-fira-mono ttf-fira-sans adobe-source-sans-pro-fonts ttf-joypixels

# Create Templates directory
mkdir ~/Templates
cd ~/Templates

# Clone de-config repository
git clone https://github.com/ismoilovdevml/de-config.git
cd de-config/xfce4-macos-config

# Move wallpapers
mv wallpapers/ ~/Pictures/

cd ~/Templates

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

# Move application desktop files
cd xpple_menu/applications/
mv Launchpad.desktop ~/.local/share/applications/
mv xfce-settings-manager.desktop ~/.local/share/applications/
mv xfce4-session-forcequit.desktop ~/.local/share/applications/
mv xfce4-session-logout.desktop ~/.local/share/applications/
mv xfce4-session-sleep.desktop ~/.local/share/applications/
mv pamac.manager.desktop ~/.local/share/applications/
mv xfce4-about.desktop ~/.local/share/applications/
mv xfce4-session-lockscreen.desktop ~/.local/share/applications/
mv xfce4-session-restart.desktop ~/.local/share/applications/

# Create menu directory and move menu file
cd ~/.config/
mkdir menu
cd ~/Templates/de-config/xfce4-macos-config/xpple_menu/
mv xpple.menu ~/.config/menu/

# Move launchpad icon
cd ~/Templates/de-config/xfce4-macos-config/icons/
mv launchpad.svg ~/.local/share/icons/

# Apply tweaks
cd ~/Templates/WhiteSur-gtk-theme
./tweaks.sh -f

# Install additional utilities
sudo pacman -S neofetch lolcat figlet btop htop duf
yay -S pamac-aur
# Change shell to fish
sudo pacman -S fish
chsh -s /usr/bin/fish
fish
set -U fish_greeting ""

# Change root shell to fish
sudo su
chsh -s /usr/bin/fish
fish
set -U fish_greeting ""
exit

exit