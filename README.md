# Arch Linux Dotfiles and Setup

This is the dotfiles repo for my Arch installations.

Various bits of the code here has been lifted from other places and people, some of whom are lost from my memory. Where I remember I provide attribution.
This is now my main Linux config.

## Machine-specific Init Commands

After messing around with two branches of these dotfiles I became sick of having to merge changes in one into the other, and vice versa. It was just annoying. Then I realised that the only real differences between the laptop and the desktop were keyboard and `.xinitrc` based. So, I decided to source in .xinitrc instead. The code blocks below are sample settings that should go into the desktop and laptop respectively.

```sh
dwm-bar & # Print shit out in the bar
setxkbmap -layout us -variant colemak -option caps:super && killall xcape 2>/dev/null ; xcape -e 'Super_L=Escape' &

#exec i3
while :; do
	ssh-agent dwm || break
done
```
