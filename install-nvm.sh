if [ -n "$NVM_DIR" ]
then
  rm -rf "$NVM_DIR" ~/.npm
  sed -i .bak '/NVM_DIR/d' ~/.zshrc
  unset NVM_DIR
fi

echo "Installing NVM"
curl -s -o- https://raw.githubusercontent.com/creationix/nvm/v0.39.1/install.sh | zsh

. ~/.zshrc

nvm install 16
nvm install 13
nvm install 12
nvm install 10
nvm alias default 16
