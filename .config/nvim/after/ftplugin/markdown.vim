" SETTINGS:
set foldlevel=2
set fillchars=fold:\    " Wipe out fillchars for Markdown files

set foldtext=aarleks#settings#markdownfold()

let g:markdown_fenced_languages = ['vim', 'r', 'python', 'sh', 'lua', 'c']
let g:markdown_folding = 1
let g:pandoc#syntax#codeblocks#embeds#langs = ["sh", "r", "python", "markdown", "c", "vimscript"]

let $FZF_BIBTEX_CACHEDIR = '/home/alex/Dropbox/WritingTools/bibcache/'
let $FZF_BIBTEX_SOURCES = '/home/alex/Dropbox/WritingTools/zotero-library.bib'

function! s:bibtex_cite_sink(lines)
    let r=system("bibtex-cite ", a:lines)
    execute ':normal! i' . r
endfunction

function! s:bibtex_cite_sink_insert(lines)
    let r=system("bibtex-cite ", a:lines)
    execute ':normal! i' . r
    call feedkeys('a', 'n')
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
inoremap ;c ```<CR><++><CR>```<CR><CR><esc>4kA
inoremap ;r ```{r}<CR>```<CR><CR><esc>2kO
inoremap ;p ```{python}<CR>```<CR><CR><esc>2kO

" TEMPLATES:
nnoremap ;art :-1read $HOME/.config/nvim/templates/article.md<CR>jA<Space>

