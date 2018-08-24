#!/bin/bash

# the very basic programs
declare -a programList
programList=("vim" "tmux" "git" "xorg-server" "xorg-xinit" "ttf-dejavu")

for i in "${programList[@]}"
do
	sudo pacman -S install "${programList[@]}"
done
