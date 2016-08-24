#!/bin/bash

# A script to copy my dot files from dotfiles directory (which is on Github) to my home

echo "*******************"
echo "starts"
echo "*******************"


dotDir="$HOME/dotfiles"
i3Dir="$HOME/.i3"

vim="$dotDir/vim/.vimrc"
tmux="$dotDir/.tmux.conf"
bashrc="$dotDir/.bashrc"
Xdefaults="$dotDir/.Xdefaults"
i3status="$dotDir/i3/.i3status.conf"
i3config="$dotDir/i3/config"

declare -a homeDot

homeDot=($vim $tmux $bashrc $Xdefaults $i3status);

for i in "${homeDot[@]}"
do
	echo "File: " "$i" "has been copied"
	cp "${homeDot[@]}" $HOME
done

echo "copying i3 config"

if [ ! -d "$i3Dir" ]
then
	mkdir $i3Dir
	cp $i3config $i3Dir
else
	cp $i3config $i3Dir

fi

echo "*******************"
echo "Done"
echo "*******************"
