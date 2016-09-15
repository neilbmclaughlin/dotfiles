. ~/.aliases
. ~/.prompt
. ~/.git-prompt.sh
. ~/.git-completion.bash

# git autocomplete
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export PATH=$PATH:$(npm -g bin)
source /usr/local/etc/bash_completion.d/password-store

export GOOGLE_ANALYTICS_TRACKING_ID=GA1
export WEBTRENDS_ANALYTICS_TRACKING_ID=WT1
export HOTJAR_ANALYTICS_TRACKING_ID=HJ1

export AZURE_STORAGE_CONNECTION_STRING="<insert connection string here"

# added by travis gem
[ -f /Users/neilmclaughlin/.travis/travis.sh ] && source /Users/neilmclaughlin/.travis/travis.sh
