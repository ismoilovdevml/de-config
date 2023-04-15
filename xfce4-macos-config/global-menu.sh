#!/bin/bash

## Install pamac

# yay -S pamac-aur

## Install Vala-Appmenu manjaro/arch

yay build vala-panel-appmenu-common-git vala-panel-appmenu-registrar-git vala-panel-appmenu-xfce-git 

sudo pacman -S appmenu-gtk-module 


xfconf-query -c xsettings -p /Gtk/ShellShowsMenubar -n -t bool -s true 

xfconf-query -c xsettings -p /Gtk/ShellShowsAppmenu -n -t bool -s true 