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

* Some settings are too casual to keep them in version control (for example
  file manager bookmarks), but I still don't want to loose them accidentally.
  In such cases I move them to my private data directory so that they are
  backed up (I don't backup my whole HOME dir because there's too much stuff
  there, like git repositories, large binary files etc.) and set up symlinks
  to their original locations.



Requirements
------------

git installed on the machine - use `install-software` role/playbook to get
it first.

