inoremap ;em \emph{}<++><Esc>T{i
inoremap ;bf \textbf{}<++><Esc>T{i
inoremap ,beg \begin{}<Enter><Enter>\end{<++>}<Enter><Esc>3kf{a

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
autocmd VimLeave *.tex !texclear %
