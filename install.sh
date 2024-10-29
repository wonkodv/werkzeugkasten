#!/usr/bin/env bash

set -e

mkdir -p ~/code ~/.config

cd "$(dirname "$0")"

nix --experimental-features "nix-command flakes" profile install .#dev

cd ~/code

if [ ! -d config ]
then
    git clone https://github.com/wonkodv/config
    make -C config install
fi

cd ~/code
if [ ! -d bashjump ]
then
    git clone https://github.com/wonkodv/bashjump
fi
