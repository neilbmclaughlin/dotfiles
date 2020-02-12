if [ -n "$NVM_DIR" ]
then
  rm -rf "$NVM_DIR" ~/.npm
  sed -i .bak '/NVM_DIR/d' ~/.zshrc
  unset NVM_DIR
fi

echo "Installing NVM"
curl -s -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | zsh

. ~/.zshrc

nvm install 13.0
nvm alias default 13.0 
