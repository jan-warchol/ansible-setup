## Basic server configuration

Most of this applies not only to organizer but to any server

### Prerequisites

ssh access to machine: `ssh-copy-id -i ~/.ssh/keys/jan@jw-lat7310.pub <host>`

python installed on the machine

inventory with both `ansible_host` and `ansible_user` specified (for passwordstore lookups).
- use inventory_hostname for passwordstore lookups? because of my machines and .local 

root password in passwordstore hosts/root@{{ansible_host}}
user password in passwordstore hosts/{{ansible_user}}@{{ansible_host}}

by convention, hostname is set to inventory hostname. (should it be ansible_host??)

# TODO

set hostname
apt update
enable automatic updates
apt install ranger
select-editor -> vim
install fail2ban ??
https://ivansalloum.com/collections/linux-server-security/
disable root login completely?
https://galaxy.ansible.com/ui/standalone/roles/geerlingguy/security/documentation/
https://galaxy.ansible.com/ui/repo/published/hifis/toolkit/content/role/unattended_upgrades/
https://github.com/hifis-net/ansible-collection-toolkit/tree/main/roles/unattended_upgrades