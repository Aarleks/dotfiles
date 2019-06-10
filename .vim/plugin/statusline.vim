" Things and stuff
highlight StatuslineFilename ctermfg=9 ctermbg=10

set statusline=
set statusline+=%#IncSearch#
set statusline+=\ %{mode()}
set statusline+=\ %#StatuslineFilename#
set statusline+=                                  " Powerline arrow.
set statusline+=\ %#PmenuSel#
set statusline+=\ %f
set statusline+=\ %#LineNr#
set statusline+=                                  " Powerline arrow.
set statusline+=%{statusline#gitbranch()}
set statusline+=%{FugitiveStatusline()}
set statusline+=\ %#Visual#
"set statusline+=%M\ %R
set statusline+=\ %{statusline#filetype()}
set statusline+=%=
set statusline+=ℓ\ %l/%L

