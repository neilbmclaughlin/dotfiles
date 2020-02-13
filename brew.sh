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
  ctags
  exercism
  curl
  kubectl
  helm@2
)

# THE editor?!
brews+=(vim)

# DBs
brews+=(postgresql)

# Upgrade if already home brew installed else install
for pkg in "${brews[@]}";
do
  brewIn "$pkg"
done

brew cleanup
