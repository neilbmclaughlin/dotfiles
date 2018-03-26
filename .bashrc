pip-install() {
  pip install "$1" && \
  sed -i '' "/$1[ =><]/d" requirements.txt && \
  pip list --format=json | jq --arg name "$1" --raw-output '.[] | select(.name==$name)| "\(.name)==\(.version)"' >> requirements.txt
}

pip-uninstall() {
  pip uninstall "$1" && \
  sed -i '' "/$1[ =><]/d" requirements.txt
}

. ~/.aliases
. ~/.prompt
. ~/.git-prompt.sh
. ~/.git-completion.bash

# git autocomplete
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi


export VISUAL=vim

#Build path to user installed python packages for pip
export PATH=$PATH:~/Library/Python/$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')/bin
# source /usr/local/etc/bash_completion.d/password-store

# Set up virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
export PROJECT_HOME=~/work/python
export VIRTUALENVWRAPPER_PROJECT_FILENAME=.profile
export VIRTUALENVWRAPPER_WORKON_CD=1
source /usr/local/bin/virtualenvwrapper.sh

# added by travis gem
[ -f /Users/neilmclaughlin/.travis/travis.sh ] && source /Users/neilmclaughlin/.travis/travis.sh

###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
