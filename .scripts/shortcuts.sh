#!/bin/bash

# Output locations
shell_shortcuts="$HOME/.config/shortcutsrc"
lf_shortcuts="$HOME/.config/lf/lfshortcuts"

# Prepare files
printf "# vim:filetype=sh\\nalias " > "$shell_shortcuts"
printf "# vim:filetype=vim\\n" > "$lf_shortcuts"

# Format the `bmdirs` file in the correct syntax and sent it to all three configs.
sed "s/\s*#.*$//;/^\s*$/d" "$HOME/.config/alias-dirs" | tee >(awk '{print $1"=\"cd "$2" && ls -a\" \\"}' >> "$shell_shortcuts") \
    >(awk '{print "map g" $1, "cd", $2 "\nmap M" $1, "$(mv $f", $2 ")\nmap C" $1, "$(cp $f", $2 ")" }' >> "$lf_shortcuts")

# Format the `configs` file in the correct syntax and sent it to both configs.
sed "s/\s*#.*$//;/^\s*$/d"  "$HOME/.config/alias-conf" | tee >(awk '{print $1"=\"$EDITOR "$2"\" \\"}' >> "$shell_shortcuts") \
    >(awk '{print "map", $1, ":e", $2 "<CR>" }' >> "$vifm_shortcuts")

