" SETTINGS:
set foldlevel=2
autocmd! BufEnter *.md colorscheme apprentice
autocmd! BufLeave *.md colorscheme solarized

let g:markdown_fenced_languages = ['vim', 'r', 'python', 'sh', 'lua', 'c']
let g:pandoc#syntax#codeblocks#embeds#langs = ["sh", "r", "python", "markdown", "c", "vimscript"]
"let $FZF_BIBTEX_CACHEDIR = '/home/alex/Dropbox/WritingTools/bibcache/'
let $FZF_BIBTEX_SOURCES = '/home/alex/Dropbox/WritingTools/new-zotero-library.bib'
"let $FZF_BIBTEX_SOURCES = '/home/alex/parsed.bib'

function! s:bibtex_cite_sink(lines)
    let r=system("bibtex-cite ", a:lines)
    execute ':normal! a' . r
endfunction

function! s:bibtex_cite_sink_insert(lines)
    let r=system("bibtex-cite ", a:lines)
    execute ':normal! a' . r
    call feedkeys('a', 'n')
endfunction

function! s:bibtex_markdown_sink(lines)
    let r=system("bibtex-markdown ", a:lines)
    execute ':normal! a' . r
endfunction

inoremap <silent> @@ <c-g>u<c-o>:call fzf#run({
                        \ 'source': 'bibtex-ls',
                        \ 'sink*': function('<sid>bibtex_cite_sink_insert'),
                        \ 'up': '40%',
                        \ 'options': '--ansi --layout=reverse-list --multi --prompt "Cite> "'})<CR>

nnoremap <silent> <leader>r :call fzf#run({
                        \ 'source': 'bibtex-ls',
                        \ 'sink*': function('<sid>bibtex_cite_sink'),
                        \ 'up': '40%',
                        \ 'options': '--ansi --multi --prompt "Cite> "'})<CR>

nnoremap <silent> <leader>m :call fzf#run({
                        \ 'source': 'bibtex-ls',
                        \ 'sink*': function('<sid>bibtex_markdown_sink'),
                        \ 'up': '40%',
                        \ 'options': '--ansi --layout=reverse-list --multi --prompt "Markdown> "'})<CR>

" MARKDOWN:
map j gj
map k gk
inoremap ;n ---<Enter>
inoremap ;b ****<++><Esc>F*hi
inoremap ;s ~~~~<++><Esc>F~hi
inoremap ;e **<++><Esc>F*i
inoremap ;h ====<Space><++><Esc>F=hi
inoremap ;i ![](<++>)<++><Esc>F[a
inoremap ;a [](<++>)<++><Esc>F[a
inoremap ;1 #<Space><Enter><Enter><++><Esc>2kA
inoremap ;2 ##<Space><Enter><Enter><++><Esc>2kA
inoremap ;3 ###<Space><Enter><Enter><++><Esc>2kA
inoremap ;l --------<Enter>
map <F5> :Pandoc pdf<CR>
inoremap ;c ```<CR><++><CR>```<CR><CR><esc>4kA
inoremap ;r ```{r}<CR>```<CR><CR><esc>2kO
inoremap ;p ```{python}<CR>```<CR><CR><esc>2kO

" TEMPLATES:
nnoremap ;art :-1read $HOME/.config/nvim/templates/article.md<CR>jA<Space>
