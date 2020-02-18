
echo "Installing pyenv"

brew install pyenv

pyenv global 3.7.3

sed -i bak '/^# PYENV START$/,/^# PYENV END$/d' ~/.zshrc

{
  echo "# PYENV START"
  echo 'eval "$(pyenv init -)"'
  echo 'PATH=$PATH:/Users/neilmclaughlin/.local/bin'
  echo "# PYENV END"
} >> ~/.zshrc

. ~/.zshrc
