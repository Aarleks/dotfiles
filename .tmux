#!/bin/sh

set -e

if tmux has-session -t dotfiles 2> /dev/null; then
    tmux attach -t dotfiles
    exit
fi

## NEW SESSION
# Main window
tmux new-session -d -s dotfiles -n nvim -x $(tput cols) -y $(tput lines)

# Launch Neovim with GFiles to look for files in the dotfiles repo
tmux send-keys -t dotfiles:nvim "nvim -c :GFiles" Enter
tmux split-window -t dotfiles:nvim -h

# Git pull and then git status
tmux send-keys -t dotfiles:nvim.right "git pull" Enter
tmux send-keys -t dotfiles:nvim.right "git status" Enter

# Launch tmux
tmux attach -t dotfiles:nvim.left
