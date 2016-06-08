#!/bin/bash

echo "*********************"
echo "Starting" 
echo "*********************"

#Directories
home="/home/kiriakos/"
usb="/media/usb0"
filed="/media/usb0/dotfiles2" #File in which dotfiles will be saved

#Mount usb0  ///check if file exists, it returns an error in terminal
mount $usb

#Create directory in usb
if [ ! -d "$filed" ]
then
	mkdir $filed
fi

#Dotfiles
vim="/home/kiriakos/.vimrc"
xinitrc="/home/kiriakos/.xinitrc"
xdefaults="/home/kiriakos/.Xdefaults"
tmux="/home/kiriakos/.tmux.conf"
feh="/home/kiriakos/.fehbg"
bashrc="/home/kiriakos/.bashrc"
i3config="/home/kiriakos/.i3/config"
i3statusbar="/home/kiriakos/.i3status.conf"

declare -a copier #array

copier=($vim $xinitrc $xdefaults $tmux $feh $bashrc $i3config $i3statusbar)

for i in "${copier[@]}"
do
	echo "File : " "$i" "has been copied"
	cp "${copier[@]}" $filed
done

echo "*********************"
echo "Done"
echo "*********************"
