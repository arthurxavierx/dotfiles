setlocal foldmethod=marker
setlocal foldlevel=0

setlocal include=^\\s*#\\s*include
setlocal includeexpr=
setlocal commentstring=--\ %s
au FileType purescript let &l:commentstring='-- %s'
