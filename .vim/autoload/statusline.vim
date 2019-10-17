function! statusline#gitbranch() abort
  let l:branchname = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
  return strlen(l:branchname) > 0?' '.l:branchname.' ':''
endfunction

function! statusline#filetype() abort
    if strlen(&filetype)
	return ',' . &filetype
    else
	return ''
    endif
endfunction

function! statusline#modetext() abort
    let g:modenow={
		\ 'n'  : 'NORMAL',
		\ 'i'  : 'INSERT',
		\ 'no' : 'Normal·Operator Pending',
		\ 'v'  : 'VISUAL',
		\ 'V'  : 'V·LINE',
		\ '^V' : 'V·BLOCK',
		\ 's'  : 'SELECT',
		\ 'S'  : 'S·LINE',
		\ '^S' : 'S·BLOCK',
		\ 'R'  : 'REPLACE',
		\ 'Rv' : 'V·REPLACE',
		\ 'c'  : 'COMMAND',
		\ 'cv' : 'VIM EX',
		\ 'ce' : 'EX',
		\ 'r'  : 'PROMPT',
		\ 'rm' : 'MORE',
		\ 'r?' : 'CONFIRM',
		\ '!'  : 'SHELL',
		\ 't'  : 'TERMINAL'
		\}
    return g:modenow[mode()]
endfunction

function! statusline#modecolour() abort
    let l:mode=mode()
    if l:mode==?'i'
	highlight User1 ctermfg=10 ctermbg=9
endfunction

 "if mode is normal, then name and colour
 "if mode is insert, then name and colour

