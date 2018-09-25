#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH=$PATH:$HOME/.scripts
export EDITOR="vim"
export TERMINAL="urxvt"
export BROWSER="firefox"
export VISUAL="vim"

if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep i3 || startx
fi
