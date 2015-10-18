This role adds fingerprints of the following servers to known_hosts:
- github.com
- bitbucket.org

This is needed for tasks that `git clone` stuff from these servers.
Of course I could tell ansible to automatically accept whatever keys
they identify themselves with (`accept_hostkey` flag), but that would
defeat the purpose of using host fingerprints for verifying host identity.
By taking public keys from files *stored permanently in this repository*
I can be sure that they are correct and that I'm really connecting to
correct servers.
