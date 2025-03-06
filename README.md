# pve

![Proxmox!](https://raw.githubusercontent.com/selfhst/icons/refs/heads/main/png/proxmox.png "Proxmox")


Scripts and functions for Proxmox

### What's all this about then?

* Anything in the "functions" folder is to designed to be "source {}"-ed, and (generally) will be defining a function that you can execute from a bash shell
* Files in the "scripts" folder are to be executable files which can be run from within bash shell. This folder should be added to your path



### To enable them for use

execute `./add_to_bashrc.sh`

This script appends the content[^1] of `./add_to_bashrc.sh.txt` to the bottom of `~/bashrc` (if not already there)


[^1]: With a `sed` call to set the path of the repo home properly