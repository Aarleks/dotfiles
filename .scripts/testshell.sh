#!/usr/bin/env bash


i3-msg "workspace 4; append_layout ~/.config/i3/workspace-1.json"

sleep 0.5
i3-msg "workspace 4; exec urxvt -e bash -c 'vim ~/Dropbox/vimwiki/index.md && bash'"

sleep 0.5
i3-msg "workspace 4; exec urxvt -e bash -c 'task && bash'"

sleep 0.5
i3-msg "workspace 4; exec urxvt -e bash -c 'ranger && bash'"
