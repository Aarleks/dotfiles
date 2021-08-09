:" NEOVIM: the grand and glorious init.vim file of Alex Norman
"============================================================
" vim:foldmethod=marker

let mapleader="\<Space>"  " Leader is spacebar
let maplocalleader="\\"   " local leader is backslash

" PLUGINS: {{{
" Check for Plug and download if not present
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
        echo "Downloading junegunn/vim-plug to manage plugins..."
        silent !mkdir -p ~/.config/nvim/autoload/
        silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/fzf.vim'                 " fuzzy finder plugin
Plug 'itchyny/vim-gitbranch'            " shows git info in statusline
Plug 'tpope/vim-fugitive'               " git plugin
Plug 'vimwiki/vimwiki'                  " personal wiki
Plug 'baskerville/vim-sxhkdrc'          " syntax highlighting for sxhkd
Plug 'jalvesaq/Nvim-R'                  " make vim into a RStudio-like IDE
" MY PLUGINS:
" Unmanaged plugins (manually installed and updated)
Plug '~/Projects/zettel.vim'            " zettelkasten interface
Plug '$HOME/Projects/notes-cabinet'     " test lua-based zettelkasten plugin
Plug '$HOME/Projects/vim-pollen'        " syntax highlighting for Pollen files - modding Joel Dueck's plugin
" AESTHETICS:
Plug 'vim-pandoc/vim-pandoc-syntax'     " syntax highlighting for Markdown prose
Plug 'arcticicestudio/nord-vim'         " Nord colourscheme
Plug 'morhetz/gruvbox'                  " Gruvbox colourscheme
Plug 'altercation/vim-colors-solarized' " Solarized colorscheme
Plug 'romainl/Apprentice'               " RomainL's colorscheme
Plug 'itchyny/lightline.vim'            " pretty statusline
Plug 'junegunn/goyo.vim'                " minimalist writing environment
Plug 'cespare/vim-toml'                 " get proper syntax highlighting for toml files
Plug 'wlangstroth/vim-racket'           " syntax highlighting for Racket
Plug 'jez/vim-better-sml'               " syntax + REPL for SMLNJ
call plug#end()
" }}}

" BASICS: {{{

set ignorecase                  " ignore character case in search
set smartcase                   " if search has uppercase character, pay attention to it
set path+=**
set number                      " show line number in the left gutter
set relativenumber              " show line number distance relative to the cursor
set wildmode=longest,list,full
set splitbelow splitright
set noshowmode
set scrolloff=5                 " start scrolling when n lines from the edge of window
" }}}

" NAVIGATION: {{{

" Shortcuts for navigating splits that remove the Control-w prefix and make
" it simply Control-<movement direction>
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
vnoremap J xjP`[V`]
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
let g:solarized_termtrans=1
"set background=dark
colorscheme solarized
"colorscheme gruvbox
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

" Goyo plugin settings
map <F10> :Goyo<CR>
inoremap <F10> <esc>:Goyo<CR>a
" }}}

" COMFY TIMES: {{{
" ===========:

" When shortcut files are updated, renew bash and lf configs with new material:
autocmd BufWritePost ~/.config/alias-conf,~/.config/alias-dirs !shortcuts

" Vimwiki Settings
let g:vimwiki_global_ext=0
let g:vimwiki_list=[{
	    \ 'path': '$HOME/Dropbox/vimwiki/',
	    \ 'syntax': 'default',
	    \ 'ext': '.md'
	    \ }]

let g:zettelkasten = '$HOME/Dropbox/NotesCabinet/Zettelkasten/' " sets folder variable for zettel.vim plugin

if has('nvim')
    " sets folder variable for notes-cabinet plugin
lua << EOF
    NotesCabinet = {
      ['~/Dropbox/NotesCabinet/Zettelkasten'] = {
        base = './',
      },
      }

EOF
endif

" }}}
