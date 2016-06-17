#!/bin/bash

dest=~/dotfiles/"$1"

mv "$1" $dest
ln -s $dest "$1"
