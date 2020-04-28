" Settings for composing email in Vim

set textwidth=0

"nnoremap <Leader>cc ?Cc:<CR>:nohlsearch<CR>A<space>
nnoremap <Leader>bcc ?Bcc:<CR>:nohlsearch<CR>A<space>
nnoremap <Leader>to ?To:<CR>:nohlsearch<CR>A<space>

" ADDRESS COMPLETION:
" Fuzzy-find addresses
" Replace the default dictionary completion with fzf-based fuzzy completion
inoremap <expr> <c-x><c-k> fzf#vim#complete("cut -d' ' -f3- /home/alex/Dropbox/aliases")

" ATTACHMENTS:
" Invoke fzf with <c-x><c-f> to find file-paths
nnoremap <Leader>att gg/^$<CR>:nohlsearch<CR>OAttach:<space>

function! s:Read_address(address)
    let mail=a:address
    execute ':normal! a' . mail . ' '
endfunc

nnoremap <Leader>cc mm?Cc:<CR>:nohlsearch<CR>A<space><c-o>:call fzf#run({
                        \ 'source': "cut -d' ' -f3- /home/alex/Dropbox/aliases",
                        \ 'sink': function('<sid>Read_address'),
                        \ 'up': '20%',
                        \ 'options': '--ansi --multi --prompt "Email> "'})<CR><CR>

inoremap <silent> @@ <c-g>u<c-o>:call fzf#run({
                        \ 'source': "cut -d' ' -f3- /home/alex/Dropbox/aliases",
                        \ 'sink': function('<sid>Read_address'),
                        \ 'up': '20%',
                        \ 'options': '--ansi --multi --prompt "Email> "'})<CR>

