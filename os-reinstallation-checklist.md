Work in progress!
-----------------

check home dir
- custom scripts in bin
- downloaded stuff in inbox/downloads
- sort everything in data
  - invoices in particular
  - separate sensitive data from non-sensitive

make backup of the data
- history (encrypt it)
- ssh private key
- .gnupg trustdb - but how? How to manage two databases from separate machines?
  Should they use the same database? and sync it?

clone/push repositiories
- write a script to check them automatically for unpushed commits?

analyze git repositories settings

find any relevant personal settings


Notes for OS installation
-------------------------

Use separate partitions for `/` and `/home`. System should have at least 16 GB
space (preferably 32 GB)


Procedure
---------

- install OS (use English so that any errors can be shared with others)
- install openssh-server
- add my public key
- refresh known hosts on control machine (if applicable)

Run Ansible playbooks:

- cli-complete
- gui-complete
- secret setup
- ansible setup
- codility setup
