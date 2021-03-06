#!/usr/bin/env bash
PURPLE='\033[0;35m'
GREEN='\033[0;32m'
NC='\033[0m'

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

printf "${GREEN}Starting to symlink...${NC}\n"

ln -nfsv "$DOTFILES_DIR/.bashrc" ~
ln -nfsv "$DOTFILES_DIR/.bash_profile" ~
ln -nfsv "$DOTFILES_DIR/.gitconfig" ~
ln -nfsv "$DOTFILES_DIR/.aliases" ~
ln -nfsv "$DOTFILES_DIR/.colors" ~
ln -nfsv "$DOTFILES_DIR/.prompt" ~
ln -nfsv "$DOTFILES_DIR/.git-prompt.sh" ~
ln -nfsv "$DOTFILES_DIR/.git-completion.bash" ~
ln -nfsv "$DOTFILES_DIR/.vimrc" ~
ln -nfsv "$DOTFILES_DIR/.tern-project" ~
ln -nfsv "$DOTFILES_DIR/.vim/doc" ~/.vim
ln -nfsv "$DOTFILES_DIR/.vim/ftplugin" ~/.vim

printf "${GREEN}Finished creating symlinks...${NC}\n"

# Reload environment
. ~/.bashrc
