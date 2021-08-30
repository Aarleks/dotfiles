#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH=$PATH:$HOME/.scripts
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox"
export VISUAL="nvim"
export PATH=$PATH:$HOME/.gem/ruby/2.6.0/bin

if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep i3 || startx
fi
. "$HOME/.cargo/env"
