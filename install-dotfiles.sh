#!/usr/bin/env bash
PURPLE='\033[0;35m'
GREEN='\033[0;32m'
NC='\033[0m'

export DOTFILES_DIR
DOTFILES_DIR="$( pwd )"

printf "${GREEN}Starting to symlink...${NC}\n"

ln -nfsv "$DOTFILES_DIR/.tmux.conf" ~
ln -nfsv "$DOTFILES_DIR/.gitconfig" ~
ln -nfsv "$DOTFILES_DIR/.aliases" ~
ln -nfsv "$DOTFILES_DIR/.colors" ~
ln -nfsv "$DOTFILES_DIR/.vimrc" ~
ln -nfsv "$DOTFILES_DIR/.tern-project" ~
ln -nfsv "$DOTFILES_DIR/.vim/doc" ~/.vim
ln -nfsv "$DOTFILES_DIR/.vim/ftplugin" ~/.vim

# don't replace existing .zshrc unless you explicitly want to
# ln -nfsv "$DOTFILES_DIR/.zshrc" ~
# . ~/.zshrc

printf "${GREEN}Finished creating symlinks...${NC}\n"

# Reload environment
