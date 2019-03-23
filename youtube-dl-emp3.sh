#!/bin/bash

enviroment_dir="youtube/"
download_dir="${enviroment_dir}downloads"
youtube_dl_command="youtube-dl --extract-audio --prefer-ffmpeg --audio-format mp3"

if [ ! -d $download_dir ]; then
    mkdir -p $download_dir
    echo "Created download directory"
fi


if [ ! -d "${enviroment_dir}venv" ]; then
    echo "Setting up a Python virtual enviroment and installing youtube_dl"
    ( cd $enviroment_dir && python -m venv venv && source venv/bin/activate && pip install youtube_dl && deactivate )
fi

read -p "Enter YouTube link: " youtube_link
download_mp3=("$youtube_dl_command" "$youtube_link")

echo "${download_mp3[@]}"

( cd $enviroment_dir && source venv/bin/activate && cd "../${download_dir}" && eval "${download_mp3[@]}" && deactivate )
