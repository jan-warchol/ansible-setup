#!/bin/bash

set -eu  # abort on errors/undefined variables

NORMAL="\e[00m"; BOLD="\e[1;39m"

# make sure it's possible to `ssh localhost` using machine's own ssh key
mkdir -p ~/.ssh
key_name="id_rsa"

if [ ! -e "~/.ssh/$key_name" ]; then
    echo -e "${BOLD}This account doesn't have an ssh key - creating new one."
    echo -e "This key will not be password-protected, so it's advised"
    echo -e "to use it only to connect to this machine itself.${NORMAL}\n"
    sleep 2
    ssh-keygen -t rsa -N "" -f "$HOME/.ssh/$key_name"
    echo -e "${BOLD}Key $key_name created successfully.${NORMAL}"
fi

grep --quiet --fixed-strings "$(cat ~/.ssh/${key_name}.pub)" ~/.ssh/authorized_keys
if [ $? -eq 1 ]; then
    echo -e "${BOLD}Adding $key_name to authorized keys.${NORMAL}\n"
    sleep 2
    cat "$HOME/.ssh/${key_name}.pub" >> ~/.ssh/authorized_keys
fi

echo -e "${BOLD}Installing Ansible and OpenSSH.${NORMAL}\n"
# Ansible from official repos is ancient - use PPA
sudo apt-add-repository --yes ppa:ansible/ansible
sudo apt-get update
sudo apt-get install --yes ansible openssh-server
