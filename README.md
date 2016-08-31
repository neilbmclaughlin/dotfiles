# Dot files

Clone the repo somewhere on the local disk and run `./install.sh`. This will:

* Symlink all dotfiles into the user's home directory
* Install [Homebrew](http://brew.sh/) and some packages
* Install [Caskroom](https://caskroom.github.io/) and some applications

During the install of Homebrew you will be prompted for your password.

Vim specifics
=============

You will need to run :PluginInstall on first usage of vim
  You will see an error for a missing colour scheme ('distinguished') until you do this
PluginInstall will install all plugins but you will need to complete the following steps to get YouCompleteMe working (otherwise you will see the error 'YouCompleteMe unavailable: No module named future' on opening vim)
    cd ~/.vim/bundle/YouCompleteMe
    git submodule update --init --recursive
    ./install.py --tern-completer

Git specifics
=============

As 2 factor auth is enabled you will need to create a git personal access token and use that 
instead of the password. After first use it will be stored in OS X Keychain.
Note: the github command line integrations seem to be different. E.g. for `git issue` use normal
username and password which will then prompt for the 2 factor code.
