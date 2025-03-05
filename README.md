# pve
Scripts and functions for Proxmox


add the following into the bottom of your `~/.bashrc`


```script

pve_repo_base=~/git/pve
folder_=$pve_repo_base/functions
if [ -d $folder_ ]; then
    for file in $(find $folder_ -type f -not -name ".git*"); do
        source "$file"
    done
fi

folder_=$pve_repo_base/scripts
if [ -d $folder_ ]; then
    case ":$PATH:" in
        *":$folder_:"*)
            ;;
        *)
            # Append the folder to the PATH
            declare -x PATH=$PATH:$folder_
            ;;
    esac
    # Set any non-executable files to executable
    find $folder_ -type f -not -name ".git*" -not -executable -print -exec chmod +x "{}" +
fi
unset folder_ pve_repo_base

```