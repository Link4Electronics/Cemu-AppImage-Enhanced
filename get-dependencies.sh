#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm pipewire-audio pipewire-jack

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common

echo "Building cemu..."
echo "---------------------------------------------------------------"

# build with x86_64_v3 target
if [ "$ARCH" = 'x86_64' ]; then
	sed -i -e 's|march=x86-64|march=x86-64-v3|g' /etc/makepkg.conf
	cat /etc/makepkg.conf
fi

make-aur-package cemu
