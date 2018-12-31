#!/usr/bin/env bash

VM_HOME=/home/vagrant

# set locale
echo 'export LC_ALL=en_US.UTF-8' >> $VM_HOME/.bashrc
source $VM_HOME/.bashrc

apt-get -qq update
apt-get -qq upgrade

# install git
apt-get -qq install git

# install build tools
apt-get install -qq make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev

# install pyenv
git clone -q https://github.com/pyenv/pyenv.git $VM_HOME/.pyenv
echo 'export PYENV_ROOT="/home/vagrant/.pyenv"' >> $VM_HOME/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> $VM_HOME/.bashrc
echo 'eval "$(pyenv init -)"' >> $VM_HOME/.bashrc

# install pyenv-virtualenv
git clone -q https://github.com/pyenv/pyenv-virtualenv.git $VM_HOME/.pyenv/plugins/pyenv-virtualenv
echo 'eval "$(pyenv virtualenv-init -)"' >> $VM_HOME/.bashrc
chown -R vagrant $VM_HOME/.pyenv

# install java
add-apt-repository -y ppa:webupd8team/java
apt-get -qq update
apt-get -qq upgrade
echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections 
echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
apt-get -qq install oracle-java8-installer
apt install oracle-java8-set-default
    
