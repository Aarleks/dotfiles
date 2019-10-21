" Settings for composing email in Vim

set textwidth=0

nnoremap <Leader>cc ?Cc:<CR>:nohlsearch<CR>A<space>
nnoremap <Leader>bcc ?Bcc:<CR>:nohlsearch<CR>A<space>
nnoremap <Leader>to ?To:<CR>:nohlsearch<CR>A<space>

" ADDRESS COMPLETION:
" Fuzzy-find addresses
" Replace the default dictionary completion with fzf-based fuzzy completion
inoremap <expr> <c-x><c-k> fzf#vim#complete("cut -d' ' -f3- /home/alex/Dropbox/aliases")

" ATTACHMENTS:
" Invoke fzf with <c-x><c-f> to find file-paths
nnoremap <Leader>att gg/^$<CR>:nohlsearch<CR>OAttach:<space>
