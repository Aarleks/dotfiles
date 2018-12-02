#!/bin/bash

# Take a screenshot:
#scrot /tmp/screen.png

# Create a blur on the shot:
#convert /tmp/screen.png -paint 1 -swirl 50 /tmp/screen.png


# Add the lock to the blurred image:
#[[ -f ~/.config/i3/lock.png ]] && convert /tmp/screen.png  ~/.config/i3/lock.png -gravity center -composite -matte /tmp/screen.png

# Pause music (mocp and mpd):
mocp -P
mpc pause

#urxvt -e cmatrix & sleep 0.2

#i3-msg fullscreen

# Lock it up!
#i3lock -e -f -c 000000 -i /tmp/screen.png
i3lock -e -f -c 000000 -i ~/Downloads/wall.jpg
#i3lock -n: i3-msg kill
# If still locked after 20 seconds, turn off screen.
sleep 20 && pgrep i3lock && xset dpms force off
