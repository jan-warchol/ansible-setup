This role adds keys of some public servers like github.com to known_hosts,
which is needed for other roles that `git clone` stuff from them.  Of course
I could have used `accept_hostkey` flag in these tasks, but I prefer to do
things securely when I can.