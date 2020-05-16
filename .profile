#!/bin/sh
#

export PATH="$(du $HOME/.scripts/ | cut -f2 | tr '\n' ':')$PATH"
export PATH="$PATH":$HOME/.local/bin
export PATH="$PATH":$HOME/go/bin
export PATH="/home/alex/.gem/ruby/2.6.0/bin:$PATH"
#export TERM="alacritty"
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"
export VISUAL="nvim"
export FILES="lf"
export READER="zathura"

# Cleaning up $HOME
export ZDOTDIR="$HOME/.config/zsh"
export INPUTRC="$HOME/.config/inputrc"
export NOTMUCH_CONFIG="$HOME/.config/notmuch-config"
export PASSWORD_STORE_DIR="$HOME/.local/share/password-store"

# less/man colors
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"; a="${a%_}"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"; a="${a%_}"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"; a="${a%_}"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"; a="${a%_}"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"; a="${a%_}"

[ ! -f ~/.config/shortcutsrc ] && shortcuts.sh >/dev/null 2>&1

if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep i3 || startx
fi
