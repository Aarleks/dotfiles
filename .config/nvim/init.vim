" NEOVIM: the grand and glorious init.vim file of Alex Norman
"============================================================
" vim:foldmethod=marker

let mapleader="\<Space>"
let maplocalleader="\\"

" PLUGINS: {{{
" Check for Plug and download if not present
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
        echo "Downloading junegunn/vim-plug to manage plugins..."
        silent !mkdir -p ~/.config/nvim/autoload/
        silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'tpope/vim-fugitive'
Plug 'altercation/vim-colors-solarized'
Plug 'vimwiki/vimwiki'
Plug 'mboughaba/i3config.vim'
"Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
"Plug 'roxma/nvim-yarp'
"Plug 'ncm2/ncm2'
Plug 'baskerville/vim-sxhkdrc'
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
call plug#end()
" }}}

" BASICS: {{{

set ignorecase
set smartcase
set path+=**
set number
set relativenumber
set wildmode=longest,list,full
set splitbelow splitright
set noshowmode
set scrolloff=5
" }}}

" NAVIGATION: {{{

" Shortcuts for navigating splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" matchit.vim is built-in
" Hit % on if or else to jump to its partner
runtime macros/matchit.vim
" }}}

" EDITING: {{{

" replace native filepath completion with fzf
imap <c-x><c-f> <plug>(fzf-complete-path)

" Set Markdown files as markdown.pandoc for pandoc-syntax
augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

set go=a " visual mode - highlighted text is copied to the clipboard
set shiftwidth=4
let &softtabstop=&shiftwidth

" Delete training whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Disables auto-commenting of new lines
autocmd FileType * setlocal formatoptions-=r formatoptions-=o

" Replace all -
nnoremap S :%s//g<Left><Left>

" Move lines in Visual Mode
vnoremap H <gv
"vnoremap J xjP`[V`]
vnoremap J :m '>+1<CR>gv=gv
vnoremap K xkP`[V`]
vnoremap L >gv

set grepprg=rg\ --vimgrep\ --smart-case\ --no-config\ --max-columns\ 1000
set grepformat=%f:%l:%c:%m

command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case " . <q-args>, 1, <bang>0)

command! -bang -nargs=* RG call fzf#vim#grep("rg --no-ignore-parent --column --line-number --no-heading --color=always --smart-case " . <q-args>, 1, <bang>0)

" }}}

" AESTHETICS: {{{
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

" Make comments italics
" Needs to go after colour plugin is loaded to override it
highlight Comment cterm=italic

" Goyo stuffs
map <F10> :Goyo<CR>
inoremap <F10> <esc>:Goyo<CR>a
" }}}

" COMFY TIMES: {{{
" ===========:

" When shortcut files are updated, renew bash and vifm configs with new material:
autocmd BufWritePost ~/.config/alias-conf,~/.config/alias-dirs !shortcuts.sh

" Vim-LaTeX-Live-Preview settings
let g:livepreview_previewer = 'zathura'
let g:livepreview_engine = 'xelatex'

" Vimwiki Settings
let g:vimwiki_global_ext=0
let g:vimwiki_list=[{
	    \ 'path': '$HOME/Dropbox/vimwiki/',
	    \ 'syntax': 'markdown',
	    \ 'ext': '.md'
	    \ }]

" }}}
