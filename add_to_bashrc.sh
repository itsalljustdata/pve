#!/usr/bin/env bash

pve_repo_base__=$(dirname $0) # this folder (which is assumed to be the repo_base folder)
textFile="${0%.*}.txt"        # this file with a .txt extension

# Detect the user's default shell
default_shell=$(basename "$SHELL")

# Set the rc file based on the default shell
case "$default_shell" in
    bash)
        rcfile=~/.bashrc
        ;;
    zsh)
        rcfile=~/.zshrc
        ;;
    ksh)
        rcfile=~/.kshrc
        ;;
    *)
        rcfile=~/.bashrc # Fallback to .bashrc if the shell is not recognized
        ;;
esac



if [ ! -f $rcfile ]; then
    echo -e "\n$rcfile not found\n"
    exit 1
elif [ ! -f $textFile ]; then
    echo -e "\n$textFile not found\n"
    exit 1
else
    function appendToRc () {
        local rcFile=$1
        local pve_repo_base__=$2 # this folder (which is assumed to be the repo_base folder)
        local textFile=$3        # this file with a .txt extension
        if [ ! -f "$rcFile" ]; then
            return 0
        elif [ ! -f "$textFile" ]; then
            echo "[error] $textFile not found"
            return 1
        elif ! grep -q "pve_repo_base" "$rcFile"; then
            sed 's:__pve_repo_base__:'$pve_repo_base__':g' "$textFile" | tee -a "$rcFile"
        fi
    }
    export -f appendToRc
    find ~ -maxdepth 1 -type f -name ".*shrc" -exec bash -c 'appendToRc "$0" "'$pve_repo_base__'" "'$textFile'"' {} \;
fi
unset pve_repo_base__ textFile rcfile default_shell