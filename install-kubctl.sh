brew install kubectl
[ $(grep --count kubectl  ~/.aliases) -eq 0 ] && echo "alias k='kubectl'" >> ~/.aliases
if [ ! -d ~/.kube/configs ]
then
  mkdir -p ~/.kube/configs
else
  rm -Rf ~/.kube/configs/ffcldneksawss001
fi
git clone http://gitlab.ffc.aws-int.defra.cloud/kubernetes/ffcldneksawss001.git ~/.kube/configs/ffcldneksawss001 
