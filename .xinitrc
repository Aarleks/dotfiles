#!/bin/sh

xrdb ~/.Xresources &
kblayout.sh &
sxhkd &

xset r rate 300 50 &

exec i3

