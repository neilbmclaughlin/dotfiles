
echo "Installing pyenv"

brew install pyenv

pyenv global 3.7.3

sed -i bak '/^# PYENV START$/,/^# PYENV END$/d' ~/.zshrc

{
  echo "# PYENV START"
  echo 'eval "$(pyenv init -)"'
  echo 'PATH=$PATH:/Users/neilmclaughlin/.local/bin'
  echo '# The following line is requested by vim so any installed python is dynamic'
  echo 'export PYTHON_CONFIGURE_OPTS="--enable-framework"'
  echo "# PYENV END"
} >> ~/.zshrc

. ~/.zshrc
