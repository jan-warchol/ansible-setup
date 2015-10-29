Automating my own computer configuration
----------------------------------------

I have scripted most of my system configuration using [Ansible](http://docs.ansible.com/)
(a powerful, but surprisingly easy to learn tool for automation,
remote execution and configuration management).  This allows me
to setup new workstations easily, and to keep settings of all my accounts in sync.



Is it worth it?
---------------

It depends.  If you only use one machine, it's nice to have an authoritative
source of information on what you install and configure on a new system,
but this only pays off if you reinstall often (say, every couple months?).

If you have two machines - or two user accounts, for work and personal stuff,
as I do - synchronizing configuration becomes an issue and it may be worth
the effort to automate it.

If you have more than two machines... you know the answer already :-)



Interesting features
--------------------

- installing remembered network configuration
- support for both personal and work user
- installing latest version of Vagrant from website (scraping instead of apt)
- (in-progess) keyboard configuration changes
- (planned) integration with `pass` password management



Requirements
------------

Debian-based Linux.  I use Linux Mint, but it should also work without
problems on Ubuntu (please open an issue if it doesn't!).
Adapting this to work on OSX as well would require some work, but if anyone
would be interested I'm open to pull requests.



Usage
-----

There are two kinds of machines:

* masters: my own computers.  Each of them has a clone of this repository and
  can run ansible playbooks to configure itself and other hosts (*including
  other masters*)

* slaves: servers I have access to, my family's computers, my accounts on other
  people's computers.  I don't run ansible from them.


### Setting up a new master

To bootstrap a completely new machine, run:

    sudo apt-get --yes install git
    cd ~/.config
    git clone https://github.com/janek-warchol/ansible-system-setup
    ./ansible-system-setup/bootstrap.sh

`bootstrap.sh` script ensures that the machine can ssh into itself and that it
has Ansible installed.

After that, update the `inventory` file and you're ready to run Ansible
playbooks.


### Setting up a new slave

1. Add it to the `inventory` file (and `/etc/hosts` if appropriate)
2. Install an SSH server, e.g. `sudo apt-get install openssh-server`
3. Copy your public key to authorized keys e.g. using `ssh-copy-id`


### Running ansible

Run Ansible playbooks like this (you can omit sudo prompt for some of them):

    ansible-playbook -i inventory install-software.yml --ask-sudo-pass

Note that some roles require packages that are installed by `install-software`
role, so you should run it first.  In particular, most of the roles require git.
I could have added git installation task to the roles that need it, but doing
so would require me to type my sudo password every time I wanted to run them -
and I'm too lazy for that.



License & Forking
-----------------

You are welcome to fork this repo and use it as a basis for your own system
provisioning.  Some things that you will have to change:

- replace information about my hosts in `inventory` file with your own
- replace public keys installed by `user-config` role

