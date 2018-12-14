#!/bin/bash

# clean arch's cache after installing programs or updating/upgrading

if [[ $EUID -ne 0 ]]; then
	echo "Run script as root or with sudo in front"
	exit 1
else
	sudo pacman -Scc
fi


