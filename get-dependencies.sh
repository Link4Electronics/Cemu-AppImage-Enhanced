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
TARGET_V3_CPU=1 make-aur-package cemu
