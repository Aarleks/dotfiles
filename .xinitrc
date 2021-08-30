#!/bin/sh

[ -f "$HOME/.config/localinitrc" ] && . ~/.config/localinitrc
[ -f "$HOME/.xprofile" ] && . ~/.xprofile

#exec i3
while :; do
    /usr/local/bin/dwm 2> /dev/null
done
#exec xmonad
##sxhkd -c $HOME/.config/berry/sxhkdrc &
#exec berry
