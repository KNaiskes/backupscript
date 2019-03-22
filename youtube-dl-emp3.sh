#!/bin/bash

enviroment_dir="youtube/"
download_dir="${enviroment_dir}downloads"

if [ ! -d $download_dir ]; then
    mkdir -p $download_dir
    echo "Created download directory"
fi

echo "Setting up a Python virtual enviroment and installing youtube_dl"
( cd $enviroment_dir && python -m venv venv && source venv/bin/activate && pip install youtube_dl )
