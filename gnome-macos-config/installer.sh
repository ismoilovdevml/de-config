#!/bin/bash

mkdir Templates

cd Templates

git clone https://github.com/ismoilovdevml/de-config.git

cd de-config/gnome-macos-config

mv .icons/ .themes/ ~/

sudo apt install gnome-tweaks plank

sudo apt-get install chrome-gnome-shell

sudo add-apt-repository ppa:agornostal/ulauncher && sudo apt update && sudo apt install ulauncher