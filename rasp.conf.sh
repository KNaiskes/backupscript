#!/bin/bash

install()
{
	install_Apps="vim tmux git"
	sudo apt-get update
	sudo apt-get install -y $install_Apps
	echo "Setting up git"
	git config --global user.name "Kiriakos Naiskes"
	git config --global user.email kiriakosnaiskes@gmail.com
}

remove()
{
	remove_Apps="nano"
	sudo apt-get remove -y $remove_Apps
	sudo apt-get autoremove
	sudo apt-get autoclean
	sudo apt-get clean
}

setup_dots()
{

	cd $HOME
	git clone https://github.com/KNaiskes/dotfiles

	#Dotfiles
	vim="$HOME/dotfiles/.vimrc"
	xdefaults="$HOME/dotfiles/.xdefaults"
	tmux="$HOME/dotfiles/.tmux.conf"
	bashrc="$HOME/dotfiles/.bashrc
	declare -a copier
	copier=($vim $xdefaults $tmux $bashrc)

	for i in "${copier[@]}"
	do
		echo "File:" "$i" "has been copied"
		cp "${copier[@]}" $HOME 
	done
}

echo "Enter 1 to install the packages, 2 to remove the packages,3 to setup dotfiles"
read  option

if [ $option == 1 ]
then
	install
elif [ $option == 2 ]
then
	remove
elif [ $option == 3 ]
then
	setup_dots
else
	echo "unknown"
fi
