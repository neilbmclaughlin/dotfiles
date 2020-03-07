#!/usr/bin/env bash

brewIn() {
  if brew ls --versions "$1" > /dev/null;
  then
    echo "Checking for upgrade '$pkg'"
    brew upgrade "$1";
  else
    echo "Installing '$pkg'"
    brew install "$1";
  fi
}

if [[ $(which -s brew) != 0 ]] ; then
    # Install Homebrew
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    brew update
fi

# Utils
brews=(
  git
  github/gh/gh
  the_silver_searcher
  cmake
  jq
  shellcheck
  httpie
  tmux
  tmuxinator
  ctags
  exercism
  curl
  helm@2
)

# THE editor?!
brews+=(vim)

# DBs
brews+=(postgresql)

# Languages
# Note: python & nodejs are installed using install-pyenv & install-nvm respectivly
brews+=(groovy)

# Upgrade if already home brew installed else install
for pkg in "${brews[@]}";
do
  brewIn "$pkg"
done

brew install romkatv/powerlevel10k/powerlevel10k
echo 'source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc

brew cleanup
