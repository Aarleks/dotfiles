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

"function! statusline#modecolour() abort
" if mode is normal, then name and colour
" if mode is insert, then name and colour

