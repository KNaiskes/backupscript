#!/bin/bash

# the very basic programs
declare -a programList
programList=("vim" "tmux" "git" "xorg-server" "xorg-xinit" "ttf-dejavu"
"alsa-utils" "pulseaudio" "i3-wm" "i3bar" "i3stauts" "i3lock")

for i in "${programList[@]}"
do
	sudo pacman -S install "${programList[@]}"
done
