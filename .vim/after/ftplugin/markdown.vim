" SETTINGS:
set foldlevel=2

let g:markdown_fenced_languages = ['vim', 'r', 'python', 'sh', 'lua']
let g:pandoc#syntax#codeblocks#embeds#langs = ["sh", "r", "python", "markdown", "c"]

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
nnoremap ;art :-1read $HOME/.vim/templates/article.md<CR>jA<Space>
