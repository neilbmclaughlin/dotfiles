#!/usr/bin/env bash

# Get cask https://caskroom.github.io/
brew tap caskroom/cask

# Browsers
casks=(google-chrome firefox)

# Utils
casks+=(spectacle
iterm2
google-drive
evernote
caffeine
vmware-horizon-client
royal-tsx
wireshark
disablemonitor
screenhero
keepassx
docker
java)

# Editors
casks+=(atom)

# IM
casks+=(slack skype)

# Misc
casks+=(spotify java microsoft-azure-storage-explorer robomongo kitematic)

# The update does all pkgs so just do it once
echo "Updating..."
brew cask update

# Upgrade if already home brew installed else install
for pkg in "${casks[@]}"; do
  update_pkg="$(brew cask list -1 | grep ${pkg})"
  if [[ ! "$update_pkg" ]]; then
    echo "Installing '$pkg'..."
    brew cask install "$pkg"
  else
    echo "'$update_pkg' already installed"
  fi
done

# Cleaup
brew cask cleanup
