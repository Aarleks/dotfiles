" Playing around with Neovim
"

let mapleader=" "

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
        echo "Downloading junegunn/vim-plug to manage plugins..."
        silent !mkdir -p ~/.config/nvim/autoload/
        silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'tpope/vim-fugitive'
Plug 'altercation/vim-colors-solarized'
Plug 'vimwiki/vimwiki'
Plug 'mboughaba/i3config.vim'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
call plug#end()


" BASICS:
"filetype plugin indent on
"syntax on

"set incsearch
"set hlsearch
set ignorecase
set smartcase
set path+=**
"set encoding=utf-8
set number
set relativenumber
set wildmode=longest,list,full
"set wildmenu
set splitbelow splitright
"set laststatus=2
set noshowmode


" NAVIGATION:
" Quick buffer navigation
nnoremap gb :ls<CR>:b<Space>

" Shortcuts for navigating splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" matchit.vim is built-in
" Hit % on if or else to jump to its partner
runtime macros/matchit.vim

" For removing search highlighting
nnoremap <Leader>hl :nohlsearch<CR>

" Show invisible formatting (thanks to Vimcasts episode
" http://vimcasts.org/episodes/show-invisibles/
nmap <leader>l :set list!<CR>


" EDITING:
"set autoindent
"set backspace=indent,eol,start
set go=a " visual mode - highlighted text is copied to the clipboard
set shiftwidth=4
let &softtabstop=&shiftwidth

" normal mode - c no longer cuts to the register
"nnoremap c "_c

" Deleter training whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Disables auto-commenting of new lines
autocmd FileType * setlocal formatoptions-=r formatoptions-=o

" Replace all -
nnoremap S :%s//g<Left><Left>

vnoremap K xkP`[V`]
vnoremap J xP`[V`]
vnoremap L >gv
vnoremap J <gv

" Editing placeholder guides a la Luke Smith
inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
map <Space><Tab> <Esc>/<++><Enter>"_c4l


" AESTHETICS:
" ==========:

"set background=dark
let g:solarized_termtrans=1
colorscheme solarized
let g:lightline = {
	    \ 'colorscheme': 'solarized',
	    \ 'active': {
	    \   'left': [ [ 'mode', 'paste' ],
	    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
	    \ },
	    \ 'component_function': {
	    \    'gitbranch': 'fugitive#head'
	    \ },
	    \ }

" Goyo stuffs
map <F10> :Goyo<CR>
map <leader>f :Goyo<CR>
inoremap <F10> <esc>:Goyo<CR>a

" COMFY TIMES:
" ===========:

let g:vimwiki_global_ext=0
let g:vimwiki_list=[{
	    \ 'path': '$HOME/Dropbox/vimwiki/',
	    \ 'syntax': 'markdown',
	    \ 'ext': '.md'
	    \ }]

let g:pandoc#biblio#bibs=["/home/alex/Dropbox/WritingTools/zotero-library.bib"]

"let g:python3_host_prog='/usr/bin/python3.7'

" enable ncm2 for all buffers
"autocmd BufEnter * call ncm2#enable_for_buffer()

" :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

augroup my_cm_setup
    autocmd!
    autocmd BufEnter * call ncm2#enable_for_buffer()
    autocmd Filetype pandoc call ncm2#register_source({
      \ 'name': 'pandoc',
      \ 'priority': 8,
      \ 'scope': ['pandoc'],
      \ 'mark': 'md',
      \ 'word_pattern': '\w+',
      \ 'complete_pattern': ['@'],
      \ 'on_complete': ['ncm2#on_complete#omni', 'pandoc#completion#Complete'],
      \ })
augroup END

" Use urlview to choose a valid url from the file and open it
noremap <leader>u :w<Home>silent <End> !urlview<CR>

