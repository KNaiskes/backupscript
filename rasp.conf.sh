#!/bin/bash

install()
{
	install_Apps="vim"
	sudo apt-get update
	sudo apt-get install -y $install_Apps
}

remove()
{
	remove_Apps="nano"
	sudo apt-get remove -y $remove_Apps
	sudo apt-get autoremove
	sudo apt-get autoclean
	sudo apt-get clean
}

echo "Enter 1 to install the packages, 2 to remove the packages"
read  option

if [ $option == 1 ]
then
	install
elif [ $option == 2 ]
then
	remove
else
	echo "unknown"
fi
