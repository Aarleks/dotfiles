# Arch Linux Dotfiles

This is the dotfiles repo for my Arch installations.

Various bits of the code here has been lifted from other places and people, some of whom are lost from my memory. Where I remember I provide attribution.

### Installation

Copied [Luke Smith's]() LARBS script and made some minor modifications. It works very nicely (I've done 4 installations with it so far).

```sh
# Download the script
curl -LO https://raw.githubusercontent.com/Aarleks/dots-installer/master/strappyboot.sh

# Run the script to install all packages and dependencies
bash strappyboot.sh
```

This will take a while. The script assumes you are signed in as root, and will ask you to create a new user and password and will then proceed without too much intervention until all is done.

## Main Packages and Commands



### AUR Package Management

I use `yay` to download packages from the Arch User Repository.

### Window Manager: `DWM`

After starting with Ubuntu, then moving to i3, I migrated to Arch in 2017. I kept using Arch+i3 on all my machines until early 2019 when I started trialling `dwm`. As of late 2019 all my machines use `dwm`.

stuff about dwm, including branch management and sxhkd.

### Terminal: `ST`


### Tmux

I use `tmux` to read emails using `neomutt` and to manage projects. For the latter, I have borrowed the `.tmux` file from [Greg Hurrell](https://github.com/wincent/wincent), which allows me to set up workspaces specific to each project. I then run the `tman` zsh command to launch `tmux` into the workspace, or re-attach to the workspace if it already exists.

- `email` function in zsh folder
- `tman` function in zsh folder
- `.tmux` files in project directories (including `$HOME`)
- `tm` function in `.scripts/` to present a list of tmux sessions to pick from.

### Machine-specific Init Commands

After messing around with two branches of these dotfiles I became sick of having to merge changes in one into the other, and vice versa. It was just annoying. Then I realised that the only real differences between the laptop and the desktop were keyboard and `.xinitrc` based. So, I decided to source in .xinitrc instead. The code blocks below are sample settings that should go into the desktop and laptop respectively.

**On the laptop**

```sh
setxkbmap -layout us -variant colemak -option caps:super && killall xcape 2>/dev/null ; xcape -e 'Super_L=Escape' &
```

**On the desktop**

```sh
setxkbmap -layout us -option caps:super && killall xcape 2>/dev/null ; xcape -e 'Super_L=Escape' &
```

### Neomutt for Email

Neomutt

mutt-wizard

### Khal and DavMail for Calendar Sync

Lots of fiddling to get this right, but in the end I've been able to replicate this on two machines so I think it's working. Davmail needs to be running for `vdirsyncer` to work. The config file for vdirsyncer is easy enough to craft from the tutorial on [the website](https://vdirsyncer.pimutils.org/en/stable/). There is a config template in `~/.config/vdirsyncer/` that only needs account details added.

With this setup you can read and write to your calendars from the command line. The only thing I can't figure out how to do is respond to calendar invitations from either `Mutt` or `khal`.

The required packages are:

```sh
sudo pacman -S khal vdirsyncer python-requests-oauthlib
yay -S davmail
```

## Plain-Text Academic Writing

stuff about this here

vim + markdown + fzf + fzf-bibtex + zotero + pandoc
