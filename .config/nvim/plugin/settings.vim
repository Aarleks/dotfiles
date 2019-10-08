if has('folding')
  if has('windows')
    set fillchars=vert:┃              " BOX DRAWINGS HEAVY VERTICAL (U+2503, UTF-8: E2 94 83)
    set fillchars+=fold:·             " MIDDLE DOT (U+00B7, UTF-8: C2 B7)
  endif
  set foldmethod=indent               " not as cool as syntax, but faster
  set foldlevelstart=99               " start unfolded
  set foldtext=aarleks#settings#foldtext()
endif
