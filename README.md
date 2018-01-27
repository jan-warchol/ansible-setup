This repository contains [Ansible](http://docs.ansible.com/) scripts for
setting up my machine and installing my
[dotfiles](https://github.com/jan-warchol/my-dotfiles) (which need some
external apps to work completely).



Requirements
------------

Debian-based Linux.  I use Linux Mint, but it should also work without
problems on Ubuntu (please open an issue if it doesn't!).
Adapting this to work on OSX as well would require some work, but if anyone
would be interested I'm open to pull requests.



Usage
-----

    sudo apt-add-repository --yes ppa:ansible/ansible
    sudo apt-get update
    sudo apt-get install --yes git ansible
    git clone https://github.com/janek-warchol/ansible-system-setup

Run Ansible playbooks like this (you can omit sudo prompt for some of them):

    ansible-playbook install-software.yml --ask-sudo-pass

Note that some roles require packages that are installed by `install-software`
role, so you should run it first.  In particular, most of the roles require git.
I could have added git installation task to the roles that need it, but doing
so would require me to type my sudo password every time I wanted to run them -
and I'm too lazy for that.



Forking
-------

You are encouraged to fork this repo and use it as a basis for your own system
provisioning!  Some things that you will have to change:

- replace information about my hosts in `inventory` file with your own
- replace public keys installed by `user-config` role



License
-------

MIT license.

