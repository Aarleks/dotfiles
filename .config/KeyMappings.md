# Keymapping for DWM, i3, etc.

The format here will be alphabetical with a mapping for each of the keys. Where no mapping exists the listing will have a placeholder `<++>`

# Mod and Action Keys

## Enter:

* **Super-Enter** - Spawn a new `$TERMINAL` instance using. My default is `st`.
* **Super-Shift-Enter** - Make the current window the master
* **Super-Control-Shift**<++>

## Tab:

* **Super-Tab** - Switch between current and previous tag.
* **Super-Shift-**<++>
* **Super-Control-Shift**<++>

## Backspace:

* **Super-**<++>
* **Super-Shift-backspace** - Reboot following prompt.
* **Super-Control-Shift**<++>

## Delete:

* **Super-**<++>
* **Super-Shift-**<++>
* **Super-Control-Shift**<++>

## Home:

* **Super-**<++>
* **Super-Shift-**<++>
* **Super-Control-Shift**<++>

## End:

* **Super-**<++>
* **Super-Shift-**<++>
* **Super-Control-Shift**<++>

## Insert:

* **Super-insert** - Show a `Dunst` notification with the contents of the two clipboards using the `showclip` script.
* **Super-Shift-**<++>
* **Super-Control-Shift**<++>

## Page-Up:

* **Super-**<++>
* **Super-Shift-**<++>
* **Super-Control-Shift**<++>
* **Alt-PgUp** - Zoom in `$TERMINAL` text (embiggen).

## Page-Down:

* **Super-**<++>
* **Super-Shift-**<++>
* **Super-Control-Shift**<++>
* **Alt-PgUp** - Zoom out `$TERMINAL` text (ensmallen).

## Print Screen:

* **Super-**<++>
* **Super-Shift-**<++>
* **Super-Control-Shift**<++>

# Numerics and Friends


## Numbers

NOTE: Numeric keys are tag or window numbers in tiling window managers. The actions are:

* **Super-[num]** - Move to that tag or window.
* **Super-Shift-[num]** - Move the current pane to that tag or window.
* **Super-Control-[num]** - Put the current pane in that tag in addition to this one (similar to a tmux attachment), as the lowest stacked pane.

## Grave/Tilde

* **Super-**<++>
* **Super-Shift-**<++>
* **Super-Control-Shift**<++>

## Minus

* **Super--** - Change volume by -5 with `pulsemixer`.
* **Super-Shift-**<++>
* **Super-Control-Shift**<++>

## Equal

* **Super-=** - Change volume by +5 with `pulsemixer`.
* **Super-Shift--**
* **Super-Control-Shift--**<++>

# Alphas

## A:

* **Super-a**
* **Super-Shift-a**
* **Super-Control-Shift-a**

## B:

* **Super-b** - Toggle the bar on/off. Default is off.
* **Super-Shift-**<++>
* **Super-Control-Shift**<++>

## C:

* **Super-c** - Toggle the webcam on-screen function on/off using the `camtoggle` script.
* **Super-Shift-c** -
* **Super-Control-Shift**<++>

## D:

* **Super-d** - Run the application launcher. At the moment that ir `Rofi` but let's move to a personal build of `dmenu` soon.
* **Super-Shift-**<++>
* **Super-Control-Shift**<++>

## E:

* **Super-e** - Open `Neomutt` in a `$TERMINAL` instance.
* **Super-Shift-e** - Open a read-only instance of `Neomutt`.
* **Super-Control-Shift**<++>

## F:

* **Super-f** - Open a `$FILE` instance. At the moment that is `lf`. Mnemonic = 'Files'.
* **Super-Shift-f** - Change `DWM` layout to 'Focused'.
* **Super-Control-Shift**<++>

## G:

* **Super-**<++>
* **Super-Shift-**<++>
* **Super-Control-Shift**<++>

## H:

* **Super-h** - Change the size of the stack pane horizontally by 5% in `dwm`.
* **Super-Shift-**<++>
* **Super-Control-Shift**<++>

## I:

* **Super-i** - Move curren pane into the Master stack in `dwm`. Mnemonic = 'in'.
* **Super-Shift-**<++>
* **Super-Control-Shift**<++>

## J:

* **Super-j** - Move focus down one pane in the stack in `dwm`.
* **Super-Shift-j** - Move pane down one level in the stack in `dwm`.
* **Super-Control-Shift**<++>

## K:

* **Super-k** - Move focus up one pane in the stack in `dwm`.
* **Super-Shift-k** - Move pane up one level in the stack in `dwm`.
* **Super-Control-Shift**<++>

## L:

* **Super-l** - Change the size of the stack pane horizontally by 5% in `dwm`.
* **Super-Shift-**<++>
* **Super-Control-Shift**<++>

## M:

* **Super-m** - Open `Ncmpcpp` in a `$TERMINAL` instance. Mnemonic = 'music'.
* **Super-Shift-m** - Toggle mute with `pulsemixer --toggle-mute`.
* **Super-Control-Shift**<++>

## N:

* **Super-n** - Open `Newsboat` in a `$TERMINAL` instance. Mnemonic = 'news'.
* **Super-Shift-**<++>
* **Super-Control-Shift**<++>

## O:

* **Super-o** - Move the current pane into the Stack in `dwm`. Mnemonic = 'out'.
* **Super-Shift-**<++>
* **Super-Control-Shift**<++>

## P:

* **Super-**<++>
* **Super-Shift-**<++>
* **Super-Control-Shift**<++>

## Q:

* **Super-**<++>
* **Super-Shift-**<++>
* **Super-Control-Shift**<++>

## R:

* **Super-**
* **Super-Shift-**<++>
* **Super-Control-Shift**<++>

## S:

* **Super-**<++>
* **Super-Shift-**<++>
* **Super-Control-Shift**<++>

## T:

* **Super-**<++>
* **Super-Shift-**<++>
* **Super-Control-Shift**<++>

## U:

* **Super-**<++>
* **Super-Shift-**<++>
* **Super-Control-Shift**<++>

## V:

* **Super-v** - Launch the music visualiser in a `$TERMINAL` instance.
* **Super-Shift-**<++>
* **Super-Control-Shift**<++>

## W:

* **Super-w** - Open the default `$BROWSER`. At the moment this is Firefox.
* **Super-Shift-w** - Refresh the wifi with `sudo wifi-menu`.
* **Super-Control-Shift**<++>

## X:

* **Super-x** - Lock the screen using `slock`. Really basic at this stage.
* **Super-Shift-x** - Shut the system down after a prompt.
* **Super-Control-Shift**<++>

## Y:

* **Super-**<++>
* **Super-Shift-**<++>
* **Super-Control-Shift**<++>

## Z:

* **Super-**<++>
* **Super-Shift-**<++>
* **Super-Control-Shift**<++>

