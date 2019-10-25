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
nnoremap <Leader>p :!opout <c-r>%<CR><CR>
nnoremap <Leader><Leader>p :LLPStartPreview<CR>
"" G:
"" J:

"" L:
" Show invisible formatting (thanks to Vimcasts episode
" http://vimcasts.org/episodes/show-invisibles/
nnoremap <leader>l :set list!<CR>
set listchars=tab:»\ ,eol:¬,nbsp:
nnoremap <Leader><Leader>l :-1read $HOME/.config/nvim/templates/lorem<CR>

"" U:
" Use urlview to choose a valid url from the file and open it
noremap <leader>u :w<Home>silent <End> !urlview<CR>

"" Y:
"" ::

"" A:
"" R:
"" fzf - see after/ftplugin/markdown.vim

"" S:
nnoremap <Leader>sp :call aarleks#spelling#replace()<CR>

"" T:
"" D:
"" H:
" For removing search highlighting
nnoremap <Leader><Leader>h :nohlsearch<CR>

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
nnoremap <Leader><Leader>x :xit<CR>:xit<CR>

"" C:
nnoremap <Leader>c :w! \| !compiler <c-r>%<CR>

"" V:
"" B:
" Quick buffer navigation
nnoremap <Leader>b :ls<CR>:b<Space>

"" K:
"" M:
"" <:
"" >:
"" ?:
