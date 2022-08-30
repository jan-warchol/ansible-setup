This repository contains [Ansible](http://docs.ansible.com/) scripts for
setting up my machine and installing my
[dotfiles](https://github.com/jan-warchol/dotfiles) (which need some
external apps to work completely).

Playbook organization
---------------------

- playbooks starting with `cli-` are meant for all machines/accounts (they
  setup command line environment)
- playbooks starting with `gui-` are meant only for accounts that have a
  graphical environment (they install gui packages, keyboard configuration
  etc.)


Playbook dependencies
---------------------

dotfiles playbook shouldn't require secrets on target, and on control machine
only for sudo password.
Everything should be possible to run without SSH access configured, as long as
github_url variable is set.


Requirements
------------

Debian-based Linux.  I use Linux Mint, but it should also work without
problems on Ubuntu (please open an issue if it doesn't!).
Adapting this to work on OSX as well would require some work, but if anyone
would be interested I'm open to pull requests.


Prep - remote installation
---------------------------

Assumptions: passwordless ssh access to the target machine

On target machine:

    sudo apt update
    sudo apt install openssh-server
    # show host fingerprint for verification
    ssh-keygen -lf /etc/ssh/ssh_host_ecdsa_key.pub

On control machine:

    ssh-copy-id -i ~/.ssh/keys/<key file> <target machine>

Also, add inventory file and host_vars for the new machine.
user password in pass must match inventory_hostname
host_vars must include ssh_key_name

    pass edit hosts/<target_machine>-user


Prep - local installation
--------------------------

This requires much more work.

    sudo apt-add-repository --yes ppa:ansible/ansible
    sudo apt-get update
    sudo apt-get install --yes git ansible
    git clone https://github.com/jan-warchol/ansible-system-setup

And:

- install ssh key to be able to access private repos on bitbucket
- clone password store repo
- install GPG key to be able to unlock password store

Usage
-----

Run Ansible playbooks like this (you can omit sudo prompt for some of them):

    ansible-playbook install-software.yml --ask-sudo-pass

Note that some roles require packages that are installed by `install-software`
role, so you should run it first.  In particular, most of the roles require git.
I could have added git installation task to the roles that need it, but doing
so would require me to type my sudo password every time I wanted to run them -
and I'm too lazy for that.

See also `os-reinstallation-checklist.md` for some manual steps that may need
to be done.


Forking
-------

You are encouraged to fork this repo and use it as a basis for your own system
provisioning!  Some things that you will have to change:

- replace information about my hosts in `inventory` file with your own
- replace public keys installed by `user-config` role



License
-------

MIT license.

