" Playing around with Neovim
"

let mapleader="\<Space>"
let maplocalleader="\\"

" Check for Plug and download if not present ---------------- {{{
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
        echo "Downloading junegunn/vim-plug to manage plugins..."
        silent !mkdir -p ~/.config/nvim/autoload/
        silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif
" }}}

call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/goyo.vim'
Plug '/usr/local/opt/fzf'                    " Fzf fuzzy finder
Plug 'junegunn/fzf.vim'                      " Fzf vim wrapper
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'tpope/vim-fugitive'
Plug 'altercation/vim-colors-solarized'
Plug 'vimwiki/vimwiki'
Plug 'mboughaba/i3config.vim'
"Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
"Plug 'plasticboy/vim-markdown'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
Plug 'baskerville/vim-sxhkdrc'
call plug#end()

augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END
" support front matter of various format
"let g:vim_markdown_frontmatter = 1  " for YAML format
" do not use conceal feature, the implementation is not so good
"let g:vim_markdown_conceal = 0
"let g:vim_markdown_math = 1

" BASICS:
"filetype plugin indent on
set ignorecase
set smartcase
set path+=**
set number
set relativenumber
set wildmode=longest,list,full
set splitbelow splitright
set noshowmode


" NAVIGATION:

" Shortcuts for navigating splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" matchit.vim is built-in
" Hit % on if or else to jump to its partner
runtime macros/matchit.vim


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


" AESTHETICS:
" ==========:

set linebreak
"set background=dark
let g:solarized_termtrans=1
colorscheme solarized
let g:lightline = {
	    \ 'colorscheme': 'solarized',
	    \ 'active': {
	    \   'left': [ [ 'mode', 'paste' ],
	    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
	    \   'right': [['lines'], ['filetype'], ['fileencoding', 'fileformat']]
	    \ },
	    \ 'component_function': {
	    \    'gitbranch': 'fugitive#head'
	    \ },
	    \ 'component': {
	    \    'lines': 'ℓ %l/%L'
	    \ },
	    \ }

" Goyo stuffs
map <F10> :Goyo<CR>
inoremap <F10> <esc>:Goyo<CR>a

" COMFY TIMES:
" ===========:

" When shortcut files are updated, renew bash and lf configs with new material:
autocmd BufWritePost ~/.config/alias-conf,~/.config/alias-dirs !shortcuts.sh

" Vim-LaTeX-Live-Preview settings
let g:livepreview_previewer = 'zathura'
let g:livepreview_engine = 'xelatex'

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

