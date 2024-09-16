#! /bin/bash

## Checking if strongbox is installed and ssh config setted correctly
echo "Checking for SSH Config"
if [ ! -f "$HOME/.ssh/config" ]; then
    echo "SSH Config file nto found, please install strongox and enable SSH Agent integration"
fi

## First thing, install git & co
echo "Installing XCode..."
xcode-select --install 2>/dev/null

if [ $? -ne 0 ]; then
    echo "XCode installation error!"
    exit $?
fi

## Cloning my settings
git clone git@github.com:titanzero/dotfiles.git ~/.dotfiles 2>/dev/null
if [ $? -ne 0 ]; then
    echo "Cloning of dotfiles failed!"
    exit $?
fi

## Cloning ohmzsh & pathogen
