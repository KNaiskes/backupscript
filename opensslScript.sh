#!/bin/bash

encryptFileName="encrypted.txt"
decryptFileName="decrypted.txt"

echo "Enter 1 to encrypt file or 2 to decrypt it"
read option

if [ $option == 1 ]
then
	echo "Enter filename to encrypt :"
	read EfileName
	if [ -e $EfileName ]
	then
		openssl aes-256-cbc -a -salt -in $EfileName -out $encryptFileName
		echo "Done"
	else
		echo "File >" "$EfileName" "< does not exist"
	fi
elif [ $option == 2 ]
then
	echo "Enter filename to decrypt :"
	read DfileName
	if [ -e $DfileName ]
	then
		openssl aes-256-cbc -d -a -in $DfileName -out $decryptFileName
		echo "Done"
	else
		echo "File >" "$DfileName" "< does not exist"
	fi
fi
