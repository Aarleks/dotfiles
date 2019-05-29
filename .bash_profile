#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH=$PATH:$HOME/.scripts
export EDITOR="vim"
export TERMINAL="st"
export BROWSER="firefox"
export VISUAL="vim"
export PATH=$PATH:$HOME/.gem/ruby/2.6.0/bin

if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep i3 || startx
fi
