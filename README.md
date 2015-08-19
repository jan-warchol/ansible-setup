On a completely fresh system, you need to start by running `initialize.sh`
which will install Ansible, Git and clone this repository.  After that, just
run appropriate playbooks.

    time ansible-playbook -i inventory deploy.yml --ask-sudo-pass
