#!/bin/sh

source $HOME/.scripts/git-prompt-data.sh

case "$1" in
    staged) echo $staged ;;
    untracked) echo $untracked ;;
    commits) echo $commits ;;
esac
