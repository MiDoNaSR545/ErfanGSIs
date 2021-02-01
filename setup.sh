#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    distro=$(awk -F= '$1 == "ID" {print $2}' /etc/os-release)
    if [[ "$distro" == "arch" ]]; then
       echo "Arch Linux Detected"
       sudo pacman -S --needed unace unrar zip unzip p7zip sharutils uudeview arj cabextract file-roller dtc xz python-pip brotli lz4 gawk libmpack aria2
       #aur=rar
    else
       sudo apt install unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller device-tree-compiler liblzma-dev brotli liblz4-tool axel gawk aria2 detox cpio rename build-essential simg2img aria2 python-pip -y
    fi
    pip install setuptools wheel backports.lzma docopt zstandard bsdiff4 backports.lzma protobuf pycrypto
elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install protobuf xz brotli lz4 aria2
    pip install setuptools wheel backports.lzma protobuf pycrypto bsdiff4 docopt
fi
