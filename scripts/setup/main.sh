#!/bin/bash

# This is the main script which calls other scripts to install stuff
source helpers.sh

print_info "Doing Basic update and upgrade"

sudo apt update
sudo apt -y upgrade

print_info "Update and upgrading done ... Moving to Custom stuff"

print_info "Copying Custom files to home"

mkdir -p /home/gsc2001/.themes/Orchis-dark-compact
cp ../../config/themes/Orchis-dark-compact /home/gsc2001/.themes/Orchis-dark-compact -r

cp ../../config/college.ovpn /home/gsc2001/.college.ovpn


# Docker
#source docker/install.sh

# Programming Tools
source programming_tools/install.sh

print_info "Major Stuff Done ..."
print_info "Now you need to do the following ... "
set +x
echo "1. gh auth login"
echo "2. gpg key creation and github upload"
echo "3. VsCode install"
echo "4. Pycharm, Clion Install"
