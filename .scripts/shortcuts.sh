#!/bin/bash

# Output locations
shell_shortcuts="$HOME/.config/shortcutsrc"
vifm_shortcuts="$HOME/.config/vifm/vifmshortcuts"
ranger_shortcuts="$HOME/.config/ranger/shortcuts.conf"

# Prepare files
printf "# vim:filetype=sh\\nalias " > "$shell_shortcuts"
printf "# vim:filetype=vim\\n" > "$vifm_shortcuts"

# Format the `bmdirs` file in the correct syntax and sent it to all three configs.
sed "s/\s*#.*$//;/^\s*$/d" "$HOME/.config/alias-dirs" | tee >(awk '{print $1"=\"cd "$2" && ls -a\" \\"}' >> "$shell_shortcuts") \
    >(awk '{print "map g" $1, ":cd", $2 "<CR>\nmap t" $1, "<tab>:cd", $2 "<CR><tab>\nmap M" $1, "<tab>:cd", $2 "<CR><tab>:mo<CR>\nmap Y" $1, "<tab>:cd", $2 "<CR><tab>:co<CR>" }' >> "$vifm_shortcuts") \
    | awk '{print "map g"$1" cd "$2"\nmap t"$1" tab_new "$2"\nmap m"$1" shell mv -v %s "$2"\nmap Y"$1" shell cp -rv %s "$2}' >> "$ranger_shortcuts"

# Format the `configs` file in the correct syntax and sent it to both configs.
sed "s/\s*#.*$//;/^\s*$/d"  "$HOME/.config/alias-conf" | tee >(awk '{print $1"=\"$EDITOR "$2"\" \\"}' >> "$shell_shortcuts") \
    >(awk '{print "map", $1, ":e", $2 "<CR>" }' >> "$vifm_shortcuts") \
    | awk '{print "map "$1" shell $EDITOR "$2}' >> "$ranger_shortcuts"

