#!/bin/bash
# This file is part of the SwagArch GNU/Linux distribution
# Copyright (c) 2016 Mike Krüger
# 
# This program is free software: you can redistribute it and/or modify  
# it under the terms of the GNU General Public License as published by  
# the Free Software Foundation, version 3.
#
# This program is distributed in the hope that it will be useful, but 
# WITHOUT ANY WARRANTY; without even the implied warranty of 
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU 
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License 
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#

function cleanup() {
    rm -Rrf -- */
}

function cloneall() {
    git clone https://github.com/SwagArch/swagarch-keyring.git
    git clone https://aur.archlinux.org/gnome-encfs-manager-bin.git
    git clone https://aur.archlinux.org/libgee06.git
    git clone https://aur.archlinux.org/package-query.git
    git clone https://aur.archlinux.org/yaourt.git
    git clone https://aur.archlinux.org/pamac-aur.git
    git clone https://aur.archlinux.org/mac-os-lion-cursors.git 
    git clone https://aur.archlinux.org/arc-firefox-theme-git.git
    git clone https://aur.archlinux.org/mkinitcpio-openswap.git
    git clone https://aur.archlinux.org/qgnomeplatform-git.git
    git clone https://aur.archlinux.org/fsearch-git.git
    git clone https://aur.archlinux.org/ckbcomp.git 
    git clone https://github.com/SwagArch/thunar-shares-plugin-swagarch
    git clone https://aur.archlinux.org/mugshot.git
    git clone https://aur.archlinux.org/redshift-git.git
    git clone https://github.com/SwagArch/swagarch-mirrorlist.git
    git clone https://aur.archlinux.org/xfpanel-switch.git
    git clone https://aur.archlinux.org/vibrancy-full-dark-blue.git
    git clone https://aur.archlinux.org/xed.git
    git clone https://aur.archlinux.org/xreader.git
    git clone https://aur.archlinux.org/gnome-mpv.git
    git clone https://aur.archlinux.org/gtk-theme-windows10.git
    
    #Get calamares package
    get_package "calamares" \
    "https://raw.githubusercontent.com/SwagArch/calamares-configs/master/pkg/PKGBUILD" \
    ""

    #Get swagarch-wallpapers package
    get_package "swagarch-wallpapers" \
    "https://raw.githubusercontent.com/SwagArch/swagarch-wallpapers/master/PKGBUILD" \
    "https://raw.githubusercontent.com/SwagArch/swagarch-wallpapers/master/swagarch-wallpapers.install"

    #Get swagarch-base-skel package
    get_package "swagarch-base-skel" \
    "https://raw.githubusercontent.com/SwagArch/desktop-settings/master/pkg/PKGBUILD" \
    "https://raw.githubusercontent.com/SwagArch/desktop-settings/master/pkg/swagarch-base-skel.install"

    #Get gnome-swagarch-base-skel package
    get_package "gnome-swagarch-base-skel" \
    "https://raw.githubusercontent.com/MANoj420/gnome-desktop-settings/master/PKGBUILD" \
    "https://raw.githubusercontent.com/MANoj420/gnome-desktop-settings/master/gnome-swagarch-base-skel.install"

    #Get light-locker-settings
    get_package "light-locker-settings" \
    "https://raw.githubusercontent.com/Antergos/antergos-packages/master/antergos/light-locker-settings/PKGBUILD" \
    ""

    #Get swagarch-settings-manager
    get_package "swagarch-settings-manager" \
    "https://raw.githubusercontent.com/SwagArch/swagarch-settings-manager/master/pkg/PKGBUILD" \
    ""

    get_package "rhythmbox-tray-icon" \
    "https://raw.githubusercontent.com/SwagArch/rhythmbox-tray-icon/master/pkg/PKGBUILD" \
    ""
}

function get_package() {
    package=$1
    pkbuild_url=$2
    install_url=$3
    mkdir $package
    cd $package
    wget $pkbuild_url
    if [ -n "$install_url" ]; then
        wget $install_url
    fi
    cd ..
}

function delete_dotgit_dirs() {
    for dir in */ ;
    do
        dir=${dir%*/}
        if [ "$dir" == "." ] || [ "$dir" == ".." ]; then
            continue;
        fi
	    cd $dir
	    rm -rf .git
        echo "delete .git from folder "$dir
        cd ..
    done
}

cleanup
cloneall
delete_dotgit_dirs
