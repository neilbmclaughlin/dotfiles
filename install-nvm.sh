curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.5/install.sh | bash

#above script modifies env settings in .bashrc so re-run it

. .bashrc

nvm alias default ${NODE_VERSION:8.4.0}
