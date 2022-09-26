setlocal foldmethod=marker
setlocal foldlevel=0

" setlocal include=^\\s*#\\s*include
" setlocal includeexpr=

setlocal iskeyword+='

setlocal comments=:--\ \|,:--,s1fl:{-,mb:\ \ ,ex:-}
setlocal commentstring=--\ %s
let &l:commentstring='-- %s'
