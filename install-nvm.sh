#!/bin/zsh

if [ -n "$NVM_DIR" ]
then
  rm -rf "$NVM_DIR" ~/.npm
  sed -i .bak '/NVM_DIR/d' ~/.zshrc
  unset NVM_DIR
fi

echo "Installing NVM"
curl -s -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash

. ~/.zshrc

nvm install 18
nvm install 20
nvm alias default 20

nvm use
