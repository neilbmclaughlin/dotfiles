#!/usr/bin/env bash
PURPLE='\033[0;35m'
GREEN='\033[0;32m'
NC='\033[0m'

. ./install-dotfiles.sh
. ./install-brew.sh
. ./install-gem.sh
. ./install-pyenv.sh
. ./install-pip.sh
. ./install-nvm.sh
. ./install-terraform.sh
. ./install-pkg.sh
. ./config-vim.sh
. ./config-kubectl.sh
