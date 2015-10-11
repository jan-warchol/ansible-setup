#!/bin/bash

sudo apt-get --yes install ansible git
git clone https://janek-warchol@bitbucket.org/janek-warchol/ansible-system-setup.git ~/.config/ansible-system-setup
cd ~/.config/ansible-system-setup
ansible-playbook -i inventory setup-ansible-itself.yml --ask-sudo-pass
