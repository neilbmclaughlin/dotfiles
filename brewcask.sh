#!/usr/bin/env bash

brewCaskIn() {
  if brew cask list -1 "$1" > /dev/null;
  then
    echo "Checking for upgrade - '$pkg'"
    brew cask upgrade "$1";
  else
    echo "Installing - '$pkg'"
    brew cask install "$1";
  fi
}

# Browsers
casks=(google-chrome firefox)

# Utils
casks+=(
  iterm2
  docker
  google-drive-file-stream
  visual-studio-code
  KeePassXC
  spectacle
)

# Editors
casks+=(atom)

# IM
casks+=(slack)

# Misc
casks+=(spotify)

for pkg in "${casks[@]}"; do
  brewCaskIn "$pkg"
done
