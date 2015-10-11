#!/bin/bash

NORMAL="\e[00m"; BOLD="\e[1;37m"

# Ansible from official repos is ancient - use PPA
sudo apt-add-repository --yes ppa:ansible/ansible
sudo apt-get update
sudo apt-get install --yes ansible

# make sure it's possible to `ssh localhost` using machine's own ssh key
key_name="id_rsa_${USER}@$(cat /etc/hostname)"

if [ ! -e "~/.ssh/$key_name" ]; then
    echo -e "${BOLD}Generating new ssh key for this machine.${NORMAL}"
    ssh-keygen -t rsa -N "" \
        -C "this key should be used only for logging into localhost" \
        -f "~/.ssh/$key_name"
fi

grep --quiet --fixed-strings "$(cat ~/.ssh/${key_name}.pub)" ~/.ssh/authorized_keys
if [ $? -eq 1 ]; then
    echo "${BOLD}Adding ~/.ssh/$key_name to authorized keys.${NORMAL}"
    cat "~/.ssh/${key_name}.pub" >> ~/.ssh/authorized_keys
fi

sudo apt-get install --yes openssh-server
