#!/bin/bash

# initialize MSYS2 installation
pacman -Su

# install git
echo ""
echo "Installing Git"
pacman -Sy git

# install packages
echo ""
echo "Installing MinGW64 Toolchain"
pacman -S --needed base-devel mingw-w64-x86_64-toolchain

# logout
read -p "Press any key to continue..."
logout
