#!/bin/sh

key=$(xmodmap -pke | grep -w '33' | awk "{print \$NF}")
# If the keyboard is set to US layout this will print "P".

if [ "$key" = "P" ]; then
	setxkbmap -layout us -variant colemak -option caps:super && killall xcape 2>/dev/null ; xcape -e 'Super_L=Escape'

else
	setxkbmap -layout us -option caps:super && killall xcape 2>/dev/null ; xcape -e 'Super_L=Escape'
	# Add another function in here.
fi
