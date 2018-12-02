"  _          _          ____            _ _   _     _             _
" | |   _   _| | _____  / ___| _ __ ___ (_) |_| |__ ( )___  __   _(_)_ __ ___  _ __ ___
" | |  | | | | |/ / _ \ \___ \| '_ ` _ \| | __| '_ \|// __| \ \ / / | '_ ` _ \| '__/ __|
" | |__| |_| |   <  __/  ___) | | | | | | | |_| | | | \__ \  \ V /| | | | | | | | | (__
" |_____\__,_|_|\_\___| |____/|_| |_| |_|_|\__|_| |_| |___/   \_/ |_|_| |_| |_|_|  \___|
" This vimrc is Alex Norman's customisation of Luke Smith's file that ships with his LARBS Arch Linux install. Any of my own customisations are indicated with a comment.


	:let mapleader ="-"
" Load Pathogen for plugins:
	execute pathogen#infect()

	au BufNewFile,BufReadPost *.md set filetype=markdown
	let g:markdown_fenced_languages = ['vim', 'r', 'python']

" Some basics:
	set nocompatible
	filetype plugin on
	syntax enable
	set background=dark
	let g:solarized_termtrans=1
	colorscheme solarized
	set encoding=utf-8
	set number
	set relativenumber
	set wrap	"turns on word wrapping
	set linebreak	"wrap lines sensibly
	" Need a word wrapping feature that soft breaks at ~80 characters.
	set laststatus=2
	set noshowmode
	let g:lightline = {
	\ 'colorscheme': 'solarized',
	\ }

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow
	set splitright

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Open file as suckless sent presentation
	map <leader>s :!sent<space><C-r>% 2>/dev/null &<CR><CR>

" View an image for a suckless sent presentation:
	map <leader>v $F@ly$:!feh --scale-down --auto-zoom --image-bg black <c-r>" &<CR><CR>

" Open my bibliography file in split
	map <F9> :vsp<space>~/Dropbox/WritingTools/zotero-library.bib<CR>

" Open the selected text in a split (i.e. should be a file).
	map <leader>o "oyaW:sp <C-R>o<CR>
	xnoremap <leader>o "oy<esc>:sp <C-R>o<CR>
	vnoremap <leader>o "oy<esc>:sp <C-R>o<CR>

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Open corresponding.pdf
	map <leader>p :!mupdf <c-r>%<backspace><backspace><backspace>pdf &<CR><CR>

" Compile document
	map <leader>c :!compiler <c-r>%<CR>

"For saving view folds:
	"au BufWinLeave * mkview
	"au BufWinEnter * silent loadview

" Interpret .md files, etc. as .markdown
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" Make calcurse notes markdown compatible:
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown

" Get line, word and character counts with F3:
	map <F3> :!wc <C-R>%<CR>

" Spell-check set to F6:
	map <F6> :setlocal spell! spelllang=en_gb<CR>

" -------------------------------------------------------
" ACN - Probably don't need these features in my Vim
" Toggle DeadKeys set to F7 (for accent marks):
	"so ~/.vim/luke/deadkeys.vim
	"nm <F7> :call ToggleDeadKeys()<CR>

" Source my IPA shorcuts:
"	map <leader>i :so ~/.vim/luke/ipa.vim<CR>
" -------------------------------------------------------

" Use urlview to choose and open a url:
	:noremap <leader>u :w<Home>silent <End> !urlview<CR>

" Copy selected text to system clipboard (requires xclip installed):
	vnoremap <C-c> "cy<esc>:!echo -n '<C-R>c' \|<space>xclip<CR><enter>

" Goyo plugin makes text more readable when writing prose:
	map <F10> :Goyo<CR>
	map <leader>f :Goyo<CR>
	inoremap <F10> <esc>:Goyo<CR>a

" -------------------------------------------------------
" Not sure I'll need mutt.
" Enable Goyo by default for mutt writting
	"Goyo's width will be the line limit in mutt.
	autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=72
	autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo
" -------------------------------------------------------

" Enable autocompletion:
	set wildmode=longest,list,full
	set wildmenu

" Automatically deletes all tralling whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

" When shortcut files are updated, renew bash and ranger configs with new
" material:
	autocmd BufWritePost ~/.scripts/folders,~/.scripts/configs !bash ~/.scripts/shortcuts.sh

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" C-T for new tab
	nnoremap <C-t> :tabnew<cr>

" Navigating with guides
	inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
	vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
	map <Space><Tab> <Esc>/<++><Enter>"_c4l
	inoremap ;gui <++>

" For normal mode when in terminals (in X I have caps mapped to esc, this replaces it when I don't have X)
	inoremap jw <Esc>
	inoremap wj <Esc>


 "____        _                  _
"/ ___| _ __ (_)_ __  _ __   ___| |_ ___
"\___ \| '_ \| | '_ \| '_ \ / _ \ __/ __|
 "___) | | | | | |_) | |_) |  __/ |_\__ \
"|____/|_| |_|_| .__/| .__/ \___|\__|___/
              "|_|   |_|

"""PHP/HTML
	autocmd FileType php,html inoremap ;b <b></b><Space><++><Esc>FbT>i
	autocmd FileType php,html inoremap ;i <em></em><Space><++><Esc>FeT>i
	autocmd FileType php,html inoremap ;h1 <h1></h1><Enter><Enter><++><Esc>2kf<i
	autocmd FileType php,html inoremap ;h2 <h2></h2><Enter><Enter><++><Esc>2kf<i
	autocmd FileType php,html inoremap ;h3 <h3></h3><Enter><Enter><++><Esc>2kf<i
	autocmd FileType php,html inoremap ;p <p></p><Enter><Enter><++><Esc>02kf>a
	autocmd FileType php,html inoremap ;a <a<Space>href=""><++></a><Space><++><Esc>14hi
	autocmd FileType php,html inoremap ;e <a<Space>target="_blank"<Space>href=""><++></a><Space><++><Esc>14hi
	autocmd FileType php,html inoremap ;ul <ul><Enter><li></li><Enter></ul><Enter><Enter><++><Esc>03kf<i
	autocmd FileType php,html inoremap ;li <Esc>o<li></li><Esc>F>a
	autocmd FileType php,html inoremap ;ol <ol><Enter><li></li><Enter></ol><Enter><Enter><++><Esc>03kf<i
	autocmd FileType php,html inoremap ;im <table<Space>class="image"><Enter><caption align="bottom"></caption><Enter><tr><td><a<space>href="pix/<++>"><img<Space>src="pix/<++>"<Space>width="<++>"></a></td></tr><Enter></table><Enter><Enter><++><Esc>4kf>a
	autocmd FileType php,html inoremap ;td <td></td><++><Esc>Fdcit
	autocmd FileType php,html inoremap ;tr <tr></tr><Enter><++><Esc>kf<i
	autocmd FileType php,html inoremap ;th <th></th><++><Esc>Fhcit
	autocmd FileType php,html inoremap ;tab <table><Enter></table><Esc>O
	autocmd FileType php,html inoremap ;gr <font color="green"></font><Esc>F>a
	autocmd FileType php,html inoremap ;rd <font color="red"></font><Esc>F>a
	autocmd FileType php,html inoremap ;yl <font color="yellow"></font><Esc>F>a
	autocmd FileType php,html inoremap ;dt <dt></dt><Enter><dd><++></dd><Enter><++><esc>2kcit
	autocmd FileType php,html inoremap ;dl <dl><Enter><Enter></dl><enter><enter><++><esc>3kcc


""".bib
	autocmd FileType bib inoremap ;a @article{<Enter><tab>author<Space>=<Space>"<++>",<Enter><tab>year<Space>=<Space>"<++>",<Enter><tab>title<Space>=<Space>"<++>",<Enter><tab>journal<Space>=<Space>"<++>",<Enter><tab>volume<Space>=<Space>"<++>",<Enter><tab>pages<Space>=<Space>"<++>",<Enter><tab>}<Enter><++><Esc>8kA,<Esc>i
	autocmd FileType bib inoremap ;b @book{<Enter><tab>author<Space>=<Space>"<++>",<Enter><tab>year<Space>=<Space>"<++>",<Enter><tab>title<Space>=<Space>"<++>",<Enter><tab>publisher<Space>=<Space>"<++>",<Enter><tab>}<Enter><++><Esc>6kA,<Esc>i
	autocmd FileType bib inoremap ;c @incollection{<Enter><tab>author<Space>=<Space>"<++>",<Enter><tab>title<Space>=<Space>"<++>",<Enter><tab>booktitle<Space>=<Space>"<++>",<Enter><tab>editor<Space>=<Space>"<++>",<Enter><tab>year<Space>=<Space>"<++>",<Enter><tab>publisher<Space>=<Space>"<++>",<Enter><tab>}<Enter><++><Esc>8kA,<Esc>i

"MARKDOWN
	autocmd Filetype markdown,rmd map j gj
	autocmd Filetype markdown,rmd map k gk
	autocmd Filetype markdown,rmd map <leader>w yiWi[<esc>Ea](<esc>pa)
	autocmd Filetype markdown,rmd inoremap ;n ---<Enter><Enter>
	autocmd Filetype markdown,rmd inoremap ;b ****<++><Esc>F*hi
	autocmd Filetype markdown,rmd inoremap ;s ~~~~<++><Esc>F~hi
	autocmd Filetype markdown,rmd inoremap ;e **<++><Esc>F*i
	autocmd Filetype markdown,rmd inoremap ;h ====<Space><++><Esc>F=hi
	autocmd Filetype markdown,rmd inoremap ;i ![](<++>)<++><Esc>F[a
	autocmd Filetype markdown,rmd inoremap ;a [](<++>)<++><Esc>F[a
	autocmd Filetype markdown,rmd inoremap ;1 #<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ;2 ##<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ;3 ###<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ;l --------<Enter>
	autocmd Filetype markdown map <F5> :!pandoc<space><C-r>%<space>--pdf-engine=xelatex<space>-o<space><C-r>%.pdf<Enter><Enter>
	autocmd Filetype rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>
	autocmd Filetype rmd inoremap ;r ```{r}<CR>```<CR><CR><esc>2kO
	autocmd Filetype rmd inoremap ;p ```{python}<CR>```<CR><CR><esc>2kO

vmap <expr> ++ VMATH_YankAndAnalyse()
nmap ++ vip++

vnoremap K xkP`[V`]
vnoremap J xp`[V`]
vnoremap L >gv
vnoremap H <gv

map <enter><enter> yi[:e <c-r>"<cr>
