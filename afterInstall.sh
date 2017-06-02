#!/bin/bash

# script to install and remove programs from raspbian lite
# add a new user and remove the old one
# setup my dotfiles

function configUsers {
	username="kiriakos"
	echo "Enter: 1 to add user, 2 to remove the old user(keep in mind that
	you must create a new user and ssh to it before removing the old one)"
	read option
	if [ $option == 1 ]
	then
		echo "Adding user"
		sudo adduser $username
		echo "Adding user to sudoers"
		sudo sed -i "24i$username ALL=(ALL:ALL) ALL" /etc/sudoers
	elif [ $option == 2 ]
	then
		echo "Deleting user pi"
		sudo deluser --remove-home pi
		echo "Cleaning sudoers"
		sudo sed -i '/pi/{d;}' /etc/sudoers
	fi
}

function installPrograms {
	declare -a programList
	programList=("vim" "tmux" "git");

	echo "Updating repos first"
	sleep 1
	sudo apt-get update 

	for i in "${programList[@]}"
	do
		sudo apt-get -y install "${programList[@]}"
	done
}

function removePrograms {
	declare -a programList
	programList=("nano" "vim-tiny" "adwaita-icon-theme" "hicolor-icon-theme");
	
	for i in "${programList[@]}"
	do
		sudo apt-get -y remove "${programList[@]}"
	done
		sudo apt-get -y autoremove
		sudo apt-get -y autoclean
		sudo apt-get -y clean
		sudo aptitude -y purge ~c
		sudo aptitude autoclean
		sudo aptitude clean
}

function setupdotFiles {
	cd ~
	git clone https://github.com/KNaiskes/dotfiles
	cp dotfiles/.Xdefaults $HOME
	cp dotfiles/.tmux.conf $HOME
	cp dotfiles/.bashrc $HOME
	cp dotfiles/vim/.vimrc $HOME
	sudo cp dotfiles/vim/kiriakos_theme.vim /usr/share/vim/vim80/colors
}


echo "Enter 1 to configure users, 2 to install programs, 3 to remove programs,4 to setup dotfiles"
read option

if [ $option == 1 ]
then
	configUsers
elif [ $option == 2 ]
then
	installPrograms
elif [ $option == 3 ]
then
	removePrograms
elif [ $option == 4 ]
then
	setupdotFiles
else
	echo "unknown input"
fi
