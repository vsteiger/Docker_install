#!/bin/bash

#DOCKER INSTALL SCRIPT FOR UBUNTU 16.04.1 LTS
echo "DOCKER INSTALL SCRIPT FOR UBUNTU 16.04.1 LTS"


#Step1 -- Update the package database
sudo apt-get update

#Step2 -- Add the GPG key for the official Docker repository to the system
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D


#Step3 -- Add the Docker repository to APT sources
sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'


#Step4 -- Update the package database with the Docker packages from the newly added repo
sudo apt-get update


#Step5 -- Add additional packages
sudo apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual


#Step6 -- Install from the Docker repo instead of the default Ubuntu 16.04 repo
sudo apt-cache policy docker-engine


#Step7 -- Install Docker
sudo apt-get install -y docker-engine


#Step8 -- Start docker deamon
sudo systemctl status docker


#Step9 -- Add current user to docker group for non-sudo running privilegies
sudo usermod -aG docker $(whoami)


#Step10 -- Test docker using hello-world image
docker run hello-world
