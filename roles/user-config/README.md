User configuration
------------------

This role manages configuration that differs across my accounts
or is otherwise infeasible to track as part of my [dotfiles repository]
(https://github.com/janek-warchol/my-dotfiles).  For example:

* I need different ssh config for personal and work accounts,

* I may want to ensure that some specific host fingerprints are present
  in my `known_hosts` file, but it would not make sense to track the whole
  file in git, as I don't care much about most of its contents,

* Some desktop environment settings are stored in binary files - it doesn't
  make sense to track these files, but rather track the commands that produce
  the effects I want (e.g. `gsetttings set org.gnome.foo bar`).



Requirements
------------

git installed on the machine - use `install-software` role/playbook to get
it first.

