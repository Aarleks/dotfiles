" Yoinked from Greg Hurrell's github thanks to his YouTube-ings
" https://github.com/wincent/wincent/blob/fe798113ffb7c616cb7c332c91eaffd62e781048/roles/dotfiles/files/.vim/autoload/wincent/settings.vim#L7-L20

scriptencoding utf-8

let s:middot='·'
let s:raquo='»'
let s:small_l='ℓ'

" Override default `foldtext()`, which produces something like:
"
"   +---  2 lines: source $HOME/.vim/pack/bundle/opt/vim-pathogen/autoload/pathogen.vim--------------------------------
"
" Instead returning:
"
"   »··[2ℓ]··: source $HOME/.vim/pack/bundle/opt/vim-pathogen/autoload/pathogen.vim···································
"
function! aarleks#settings#foldtext() abort
  let l:lines='[' . (v:foldend - v:foldstart + 1) . s:small_l . ']'
  let l:first=substitute(getline(v:foldstart), '\v *', '', '')
  let l:dashes=substitute(v:folddashes, '-', s:middot, 'g')
  return s:raquo . s:middot . s:middot . l:lines . l:dashes . ': ' . l:first
endfunction


function! aarleks#settings#markdownfold() abort
    let l:thisline = getline(v:lnum)
    let l:level = len(matchstr(l:thisline, '^#\{1,6}'))
    let l:indent = repeat('#', l:level)
    let l:title = substitute(getline(v:foldstart), '^#\+\s\+', '', '')
    let l:foldsize = (v:foldend - v:foldstart)
    let l:linecount = '['.l:foldsize.'ℓ'.']'

    let l:spaces_1 = ' '
    if exists('*strdisplaywidth')
	let l:title_width = strdisplaywidth(title)
    else
	let l:title_width = len(title)
    endif

    if l:title_width < 40
	let l:spaces_2 = repeat(' ', 40 - title_width)
    else
	let l:spaces_2 = ' '
    endif

    return l:indent . l:spaces_1. l:title. l:spaces_2. l:linecount
endfunction
