Ansible system setup
--------------------

This repository contains [Ansible](http://docs.ansible.com/) scripts for
configuring my Ubuntu workstations.


Required password manager setup
-------------------------------

All credentials (login passwords, sudo passwords etc.) are fetched from a local
instance of [`pass`](https://www.passwordstore.org/) (a command-line GPG-based
password manager) using a
[lookup plugin](https://docs.ansible.com/ansible/latest/collections/community/general/passwordstore_lookup.html).
When used together with GPG-agent (for caching GPG key passphrase), this allows
running any playbook without having to input anything manually.

Password for the user `{{andsible_user}}` on the host `{{inventory_hostname}}`
should be available at the following path in password store:

    hosts/{{ansible_user}}@{{inventory_hostname}}

and there should be a special `hosts/localhost` entry that returns the password
for the current user when running ansible on localhost. 

See definition of `ansible_become_password` variable in [group_vars/all.yml]
for details.


License
-------

MIT license.
