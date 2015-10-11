Requirements
------------

Debian-based Linux (tested on Linux Mint).



Usage
-----

On a completely fresh system, run

    sudo apt-get --yes install git
    cd ~/.config
    git clone https://github.com/janek-warchol/ansible-system-setup.git
    ./ansible-system-setup/bootstrap.sh

to have everything that is needed for running provisioning. After that, just
run appropriate playbooks (assuming you added the host you want to configure
to the inventory file).

    time ansible-playbook -i inventory configure-system.yml --ask-sudo-pass



Feature highlights
------------------

- support for both personal and work user
- installing latest version of Vagrant from website (scraping instead of apt)
- (in-progess) system-wide keyboard configuration changes
- (planned) integration with `pass` password management



Forking
-------

You are welcome to fork this repo and use it as a basis for your own system
provisioning!  Some things that you will have to change:

- usernames, hosts and IPs in the inventory file
- public key