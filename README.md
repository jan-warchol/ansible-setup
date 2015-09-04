On a completely fresh system, you need to start by running `initialize.sh`
which will install Ansible, Git and clone this repository.  After that, just
run appropriate playbooks.

    time ansible-playbook -i inventory deploy.yml --ask-sudo-pass

Highlights:
- support for both personal and work user
- installing latest version of Vagrant from website (scraping instead of apt)
- (in-progess) system-wide keyboard configuration changes
- (planned) integration with `pass` password management
