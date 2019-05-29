#!/bin/sh

xrdb ~/.Xresources &
kblayout.sh &
sxhkd -m 1 &

xset r rate 300 50 &

exec i3

