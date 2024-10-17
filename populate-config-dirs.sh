#!/usr/bin/env bash

readlink -f $0

set -e
mkdir -p ~/code ~/.config
cd ~/code
if [ ! -d config ]
then
    git clone https://github.com/wonkodv/config
    cd config
    make install
fi


cd ~/code/
if [ ! -d bashjump ]
then
    git clone https://github.com/wonkodv/bashjump
fi


# TODO: nvim config
