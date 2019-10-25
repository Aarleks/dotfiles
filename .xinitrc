#!/bin/sh

[ -f "$HOME/.config/localinitrc" ] && . ~/.config/localinitrc
[ -f "$HOME/.xprofile" ] && . ~/.xprofile

#exec i3
while :; do
	ssh-agent dwm || break
done
