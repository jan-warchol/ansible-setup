#!/bin/bash

set -eu  # abort on errors/undefined variables

NORMAL="\e[00m"; BOLD="\e[1;39m"

# make sure it's possible to `ssh localhost` using machine's own ssh key
if [ ! -e "$HOME/.ssh/id_rsa" ]; then
    mkdir -p "$HOME/.ssh"
    echo -e "${BOLD}This account doesn't have an ssh key - creating new one."
    echo -e "This key will not be password-protected, so it's advised"
    echo -e "to use it only to connect to localhost.${NORMAL}\n"
    sleep 2
    ssh-keygen -t rsa -N "" -f "$HOME/.ssh/id_rsa"
    echo -e "${BOLD}Adding id_rsa to authorized keys...${NORMAL}\n"
    sleep 2
    cat "$HOME/.ssh/id_rsa.pub" >> ~/.ssh/authorized_keys
fi

echo -e "${BOLD}Installing Ansible and OpenSSH...${NORMAL}\n"
sleep 2
# Ansible from official repos is ancient - use PPA
sudo apt-add-repository --yes ppa:ansible/ansible
sudo apt-get update
sudo apt-get install --yes ansible openssh-server
