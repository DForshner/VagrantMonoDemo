#!/bin/bash

# Exit if simple command fails
set -e

vagrant_dir=/vagrant/vagrant
bashrc=/home/vagrant/.bashrc

echo "--- Provisioning - Start ---"

# ----------------------------------------------- GPC signing key
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF

# ----------------------------------------------- Add Repository 
echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list

# ----------------------------------------------- Update repolist 
sudo apt-get update

# ----------------------------------------------- Install Mono
sudo apt-get -y install mono-devel

# ----------------------------------------------- Compile 
cd /vagrant/vagrant
mcs HelloWorld.cs

# ----------------------------------------------- Run 
./HelloWorld.exe

echo "--- Provisioning - End ---"
