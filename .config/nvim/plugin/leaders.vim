" LEADER KEY MAPPINGS:

" Open the last buffer
nnoremap <Leader><Leader> <C-^>

" Editing placeholder guides a la Luke Smith
inoremap <Leader><Tab> <Esc>/<++><Enter>"_c4l
vnoremap <Leader><Tab> <Esc>/<++><Enter>"_c4l
nnoremap <Leader><Tab> <Esc>/<++><Enter>"_c4l

"" Q:
" Quit
nnoremap <Leader>q :quit<CR>

"" W:
" Write
nnoremap <Leader>w :write<CR>

"" F:
" Toggle Goyo
nnoremap <leader>f :Goyo<CR>

"" P:
"" G:
"" J:

"" L:
" Show invisible formatting (thanks to Vimcasts episode
" http://vimcasts.org/episodes/show-invisibles/
nnoremap <leader>l :set list!<CR>
set listchars=tab:»\ ,eol:¬,nbsp:

"" U:
" Use urlview to choose a valid url from the file and open it
noremap <leader>u :w<Home>silent <End> !urlview<CR>

"" Y:
"" ::

"" A:
"" R:
"" S:
"" T:
"" D:
"" H:
" For removing search highlighting
nnoremap <Leader>hl :nohlsearch<CR>

"" N:
"" E:
" <LocalLeader>e -- Edit file, starting in same directory as current file.
nnoremap <LocalLeader>e :edit <C-R>=expand('%:p:h') . '/'<CR>

"" I:
"" O:
"" ":

"" Z:
"" X:
" Write and Quit
nnoremap <Leader>x :xit<CR>

"" C:
"" V:
"" B:
" Quick buffer navigation
nnoremap <Leader>b :ls<CR>:b<Space>

"" K:
"" M:
"" <:
"" >:
"" ?:
