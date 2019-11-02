# Arch Linux Dotfiles and Setup

This is the dotfiles repo for my Arch installations.

Various bits of the code here has been lifted from other places and people, some of whom are lost from my memory. Where I remember I provide attribution.
This is now my main Linux config.

## Tmux

- `email` function in zsh folder
- `tman` function in zsh folder
- `.tmux` files in project directories (including `$HOME`)
- `tm` function in `.scripts/` to present a list of tmux sessions to pick from.

## Machine-specific Init Commands

After messing around with two branches of these dotfiles I became sick of having to merge changes in one into the other, and vice versa. It was just annoying. Then I realised that the only real differences between the laptop and the desktop were keyboard and `.xinitrc` based. So, I decided to source in .xinitrc instead. The code blocks below are sample settings that should go into the desktop and laptop respectively.

**On the laptop**

```sh
setxkbmap -layout us -variant colemak -option caps:super && killall xcape 2>/dev/null ; xcape -e 'Super_L=Escape' &
```

**On the desktop**

```sh
setxkbmap -layout us -option caps:super && killall xcape 2>/dev/null ; xcape -e 'Super_L=Escape' &
```

## Khal and DavMail for Calendar Sync

Lots of fiddling to get this right, but in the end I've been able to replicate this on two machines so I think it's working. The requirements are:

```sh
sudo pacman -S khal vdirsyncer python-requests-oauthlib
```


