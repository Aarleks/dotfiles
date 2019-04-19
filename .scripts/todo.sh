#!/usr/bin/env bash

# First - delete the TODOs currently in the file.
# They start on line 23
sed -i.bak '23,$d' ~/Dropbox/vimwiki/TODO-page.md

# Second - read in the lines I have formatted specifically to be read as TODOs.
grep -r ^-\ TODO ~/Dropbox/vimwiki/* | sed "s/\/home.*ki\//\* /" | sed "s/\.md:/ /" >> ~/Dropbox/vimwiki/TODO-page.md
