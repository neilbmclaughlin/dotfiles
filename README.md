# Dot files

Pre dotfiles install activities
==============

* Install [brew](https://brew.sh)
  * ran into some file permissions issues which were resolved by following suggestions from copilot and brew
* Install [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)

Install
=======

Clone the repo to your home directory

Run
* `. ./install-dotfiles.sh`
* Copy .zshrc .zprofile .config/ from backup to ~
  * Note that got some warnings regarding insecure directories from `compint`.
  Fix was to remove global write permission from the directory
* `. ./install-brew.sh`
* `. ./install-nvm.sh`

This will:

* Symlink all dotfiles into the user's home directory
* Install brew packages and casks
* 

Other stuff to do
=================

* Configure Slack for defra-digital and ea-flood-service
* Install OpenVPN Client to allow access to Gitlab, Jenkins, etc
  * https://openvpn.net/downloads/openvpn-connect-v3-macos.dmg
  * You will need a .ovpn file to import which Cloud Service Centre (CSC) will provide.
  * Just for info, the parent page for the download is [here](https://openvpn.net/vpn-server-resources/connecting-to-access-server-with-macos/) and the section containing the download is 'Future replacement for OpenVPN Connect Client'
* Install Pluralsight
  * https://www.pluralsight.com/product/downloads

## Notes

* Needed to move nvm install code in .zshrc to before the .nvmrc watcher functions 
* Breaking neovim upgrades need resolving
* LSP in neovim may not be working correctly
