#!/usr/bin/env bash

# Install vim-plug
PLUG_PATH="${XDG_DATA_HOME:-$HOME}/.local/share/nvim/site/autoload/plug.vim"
if [[ ! -f "${PLUG_PATH}" ]]; then
  curl -fLo "${PLUG_PATH}" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Create dir for global swap, backup and undo files
if [[ ! -d ~/.vim/tmp/ ]]; then
  mkdir -p ~/.vim/tmp/{backup,swap,undo}
fi

nvim +PlugClean +PlugInstall +PlugStatus #+qall
