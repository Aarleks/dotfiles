"  _          _          ____            _ _   _     _             _
" | |   _   _| | _____  / ___| _ __ ___ (_) |_| |__ ( )___  __   _(_)_ __ ___  _ __ ___
" | |  | | | | |/ / _ \ \___ \| '_ ` _ \| | __| '_ \|// __| \ \ / / | '_ ` _ \| '__/ __|
" | |__| |_| |   <  __/  ___) | | | | | | | |_| | | | \__ \  \ V /| | | | | | | | | (__
" |_____\__,_|_|\_\___| |____/|_| |_| |_|_|\__|_| |_| |___/   \_/ |_|_| |_| |_|_|  \___|
" This vimrc is Alex Norman's customisation of Luke Smith's file that ships with his LARBS Arch Linux install. Any of my own customisations are indicated with a comment.


	let mapleader =" "
	let maploccalleader ="\\"

	call plug#begin('~/.vim/plugged')
	Plug 'junegunn/goyo.vim'
	Plug 'itchyny/lightline.vim'
	"Plug 'terryma/vim-multiple-cursors'
	Plug 'tpope/vim-fugitive'
	Plug 'altercation/vim-colors-solarized'
	Plug 'vimwiki/vimwiki'
	Plug 'mboughaba/i3config.vim'
	Plug 'vim-pandoc/vim-pandoc'
	Plug 'vim-pandoc/vim-pandoc-syntax'
"	Plug 'jceb/vim-orgmode'
	Plug 'tpope/vim-speeddating'
	"Plug 'fcpg/vim-waikiki'
	Plug 'suan/vim-instant-markdown'
	call plug#end()

" BASICS:
	set nocompatible
	filetype plugin indent on
	syntax on
	set path+=**
	set encoding=utf-8
	set number
	set relativenumber
	set wrap	"turns on word wrapping
	set linebreak	"wrap lines sensibly
	" Need a word wrapping feature that soft breaks at ~80 characters.
	set laststatus=2
	set noshowmode

	" By default Vim open new buffers at the top and left, which
	" is counterintuitive. The next two line invert that, opening
	" buffers below and right.
	set splitbelow
	set splitright

	" Enable autocompletion:
	set wildmode=longest,list,full
	set wildmenu

	" Automatically deletes all tralling whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

	" Renew bash and ranger configs when shortcut files are updated.
	autocmd BufWritePost ~/.scripts/folders,~/.scripts/configs !bash ~/.scripts/shortcuts.sh

	" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" NAVIGATION:
	" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" AESTHETICS:
	set background=dark
	let g:solarized_termtrans=1
	colorscheme solarized
	let g:lightline = {
	\ 'colorscheme': 'solarized',
	\ }

" COMFY TIMES:
	let g:vimwiki_global_ext = 0
	let g:vimwiki_list = [{'path': '$HOME/Dropbox/vimwiki/',
			\ 'syntax': 'markdown',
	 		\ 'ext': '.md'}]
	" Interpret .md files, etc. as .markdown
	"let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

	let g:instant_markdown_autostart = 0
	let g:instant_markdown_slow = 1
	"au BufNewFile,BufReadPost *.md set filetype=markdown
	"au BufNewFile,BufReadPost *.Rmd set filetype=markdown
	let g:markdown_fenced_languages = ['vim', 'r', 'python', 'sh', 'lua']

	" Show invisibles (thanks to Vimcasts! http://vimcasts.org/episodes/show-invisibles/)
	nmap <leader>l :set list!<CR>

	" Switch between keyboard layouts
	map <leader>k :!kblayout.sh<CR><CR>

	" Open my bibliography file in split
	map <F9> :vsp<space>$HOME/Dropbox/WritingTools/zotero-library.bib<CR>
	let g:pandoc#biblio#bibs=["$HOME/Dropbox/WritingTools/zotero-library.bib"]
	"map <F9> :vsp<space>$HOME/.pandoc/zotero-library.bib<CR>
	"let g:pandoc#biblio#bibs=["$HOME/.pandoc/zotero-library.bib"]

	" Open the selected text in a split (i.e. should be a file).
	map <leader>o "oyaW:sp <C-R>o<CR>
	xnoremap <leader>o "oy<esc>:sp <C-R>o<CR>
	vnoremap <leader>o "oy<esc>:sp <C-R>o<CR>

	" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

	" Open corresponding.pdf
	map <leader>p :!zathura <c-r>=expand('%:r')<CR>.pdf &<CR><CR>

	" Compile document
	map <leader>c :!compiler <c-r>%<CR>


	" Make calcurse notes markdown compatible:
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown

	" Get line, word and character counts with F3:
	map <F3> :!wc <C-R>%<CR>

	" Spell-check set to F6:
	map <F6> :setlocal spell! spelllang=en_gb<CR>

	" Use urlview to choose and open a url:
	:noremap <leader>u :w<Home>silent <End> !urlview<CR>

	" Copy selected text to system clipboard (requires xclip installed):
	vnoremap <C-c> "cy<esc>:!echo -n '<C-R>c' \|<space>xclip<CR><enter>

	" Goyo plugin makes text more readable when writing prose:
	map <F10> :Goyo<CR>
	map <leader>f :Goyo<CR>
	inoremap <F10> <esc>:Goyo<CR>a

	" Enable Goyo by default for mutt writting
	autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo

	" Navigating with guides
	inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
	vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
	map <Space><Tab> <Esc>/<++><Enter>"_c4l

	" For normal mode when in terminals (in X I have caps mapped to esc, this replaces it when I don't have X)
	inoremap jw <Esc>
	inoremap wj <Esc>


 "____        _                  _
"/ ___| _ __ (_)_ __  _ __   ___| |_ ___
"\___ \| '_ \| | '_ \| '_ \ / _ \ __/ __|
 "___) | | | | | |_) | |_) |  __/ |_\__ \
"|____/|_| |_|_| .__/| .__/ \___|\__|___/
              "|_|   |_|

" BIB:
	autocmd FileType bib inoremap ;a @article{<Enter><tab>author<Space>=<Space>"<++>",<Enter><tab>year<Space>=<Space>"<++>",<Enter><tab>title<Space>=<Space>"<++>",<Enter><tab>journal<Space>=<Space>"<++>",<Enter><tab>volume<Space>=<Space>"<++>",<Enter><tab>pages<Space>=<Space>"<++>",<Enter><tab>}<Enter><++><Esc>8kA,<Esc>i
	autocmd FileType bib inoremap ;b @book{<Enter><tab>author<Space>=<Space>"<++>",<Enter><tab>year<Space>=<Space>"<++>",<Enter><tab>title<Space>=<Space>"<++>",<Enter><tab>publisher<Space>=<Space>"<++>",<Enter><tab>}<Enter><++><Esc>6kA,<Esc>i
	autocmd FileType bib inoremap ;c @incollection{<Enter><tab>author<Space>=<Space>"<++>",<Enter><tab>title<Space>=<Space>"<++>",<Enter><tab>booktitle<Space>=<Space>"<++>",<Enter><tab>editor<Space>=<Space>"<++>",<Enter><tab>year<Space>=<Space>"<++>",<Enter><tab>publisher<Space>=<Space>"<++>",<Enter><tab>}<Enter><++><Esc>8kA,<Esc>i

" MARKDOWN:
	autocmd Filetype markdown,rmd map j gj
	autocmd Filetype markdown,rmd map k gk
	autocmd Filetype markdown,rmd inoremap ;n ---<Enter>
	autocmd Filetype markdown,rmd inoremap ;b ****<++><Esc>F*hi
	autocmd Filetype markdown,rmd inoremap ;s ~~~~<++><Esc>F~hi
	autocmd Filetype markdown,rmd inoremap ;e **<++><Esc>F*i
	autocmd Filetype markdown,rmd inoremap ;h ====<Space><++><Esc>F=hi
	autocmd Filetype markdown,rmd inoremap ;i ![](<++>)<++><Esc>F[a
	autocmd Filetype markdown,rmd inoremap ;a [](<++>)<++><Esc>F[a
	autocmd Filetype markdown,rmd inoremap ;1 #<Space><Enter><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ;2 ##<Space><Enter><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ;3 ###<Space><Enter><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ;l --------<Enter>
	autocmd Filetype markdown map <F5> :Pandoc pdf<CR>
	autocmd Filetype rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>
	autocmd Filetype rmd inoremap ;r ```{r}<CR>```<CR><CR><esc>2kO
	autocmd Filetype rmd inoremap ;p ```{python}<CR>```<CR><CR><esc>2kO

	vnoremap K xkP`[V`]
	vnoremap J xp`[V`]
	vnoremap L >gv
	vnoremap H <gv

