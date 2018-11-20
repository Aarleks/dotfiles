#!/usr/bin/env bash
key=$(xmodmap -pke | grep -w '33' | awk "{print \$NF}")
# If the keyboard is set to US layout this will print "P".

if [ $key == "P" ]; then
	setxkbmap us -variant colemak
	# Add another function in here.
else
	setxkbmap us
	# Add another function in here.
fi
