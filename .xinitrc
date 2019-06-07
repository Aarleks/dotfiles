#!/bin/sh

[ -f "$HOME/.xprofile" ] && . ~/.xprofile

#exec i3
while :; do
	ssh-agent dwm || break
done
