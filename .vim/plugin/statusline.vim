" Things and stuff
highlight link ModeColour pandocDefinitionTerm
"highlight ModeColour ctermfg=10 ctermbg=1
"highlight User1 IncSearch
" status bar colors
autocmd InsertEnter * highlight link ModeColour Search
autocmd InsertLeave * highlight link ModeColour pandocDefinitionTerm

set statusline=
"set statusline+=%#IncSearch#
set statusline+=%#ModeColour#
set statusline+=\ %{statusline#modetext()}
"set statusline+=\ %#StatusLine#
"set statusline+=                                  " Powerline arrow.
set statusline+=\ %#PmenuSel#
set statusline+=\ %f
set statusline+=\ %#LineNr#
set statusline+=                                  " Powerline arrow.
set statusline+=\ 
"set statusline+=%{statusline#gitbranch()}
set statusline+=\ %{fugitive#head()}
set statusline+=\ %#Visual#
"set statusline+=%M\ %R
set statusline+=\ %{statusline#filetype()}
set statusline+=%=
set statusline+=ℓ\ %l/%L
set statusline+=\ \|
