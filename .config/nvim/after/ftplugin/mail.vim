" Settings for composing email in Vim

setlocal spell

set textwidth=0

" Replace the default dictionary completion with fzf-based fuzzy completion
inoremap <expr> <c-x><c-k> fzf#vim#complete("cut -d' ' -f3- /home/alex/Dropbox/aliases")

