
# https://eksctl.io/introduction/installation/

brew tap weaveworks/tap
brew install weaveworks/tap/eksctl

mkdir -p ~/.zsh/completion/
eksctl completion zsh > ~/.zsh/completion/_eksctl
