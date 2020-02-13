#!/usr/bin/env bash

# Need to do this rather than use homebrew as we need to use specific earlier versions

function installTerraform() {
  VERSION=$1
  curl -s -L "https://releases.hashicorp.com/terraform/${VERSION}/terraform_${VERSION}_darwin_amd64.zip" -o "terraform.${VERSION}.zip"
  unzip "terraform.${VERSION}.zip"
  chmod ugo+x terraform
  mv terraform "/usr/local/bin/terraform.${VERSION}"
  ln -nfsv "/usr/local/bin/terraform.${VERSION}" /usr/local/bin/terraform
}

function installTerragrunt() {
  VERSION=$1
  curl -s -L "https://github.com/gruntwork-io/terragrunt/releases/download/v${VERSION}/terragrunt_darwin_amd64" -o "/usr/local/bin/terragrunt.${VERSION}"
  chmod ugo+x "/usr/local/bin/terragrunt.${VERSION}"
  ln -nfsv "/usr/local/bin/terragrunt.${VERSION}" /usr/local/bin/terragrunt
}

installTerraform "0.11.7"
installTerragrunt "0.14.10"
