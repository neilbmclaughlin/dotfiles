#!/usr/bin/env bash

printf "Installing Vundle\n"
if [[ ! -d ~/.vim/bundle/Vundle.vim/ ]]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# Install YouCompleteMe
(cd ~/.vim/bundle/YouCompleteMe && git submodule update --init --recursive && ./install.py --tern-completer)

 # Install Tern for Vim
 (cd ~/.vim/bundle/tern_for_vim && npm install)

# Create dir for global swap, backup and undo files
if [[ ! -d ~/.vim/tmp/ ]]; then
  mkdir -p ~/.vim/tmp/{backup,swap,undo}
fi

printf "Installing Vundle Plugins\n"
vim +PluginInstall +qall
