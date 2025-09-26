Apt signing keys for 3rd-party repositories. I prefer to keep them here rather
than downloaad them every time as it's slightly more secure.

Note that apt's signed-by option expects signing keys in binary .gpg format.

Commands used initally to obtain the keys:

    curl https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor > google_linux_signing_key.gpg
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft_packages_key.gpg
