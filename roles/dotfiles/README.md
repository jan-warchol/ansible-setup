Dotfiles
--------

This role installs my [dotfiles](github.com/janek-warchol/my-dotfiles).
Basically, the dotfiles repository should contain only user configuration
that is common to all my accounts, and is reasonable to track as plain
text files.  In particular, nothing here should depend on any ansible
group_vars or host_vars.

Any configs that don't meet these requirements (system-wide settings, GUI
settings that live in binary files or unwieldy XMLs, etc.) should be
managed by some other means.  In particular, settings that differ between
accounts live in `user-config` role.



Requirements
------------

- git installed on the machine - use `install-software` role/playbook to get
  it first.
  
- gvim for copying to system clipboard and using remote option.
