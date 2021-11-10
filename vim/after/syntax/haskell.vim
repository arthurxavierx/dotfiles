" syn keyword haskellForall forall
" syn match haskellLambda "\\" conceal cchar=λ

syn match haskellLabel "#[_a-z][a-zA-Z0-9_']*"
" hi! link haskellLabel String

hi! link haskellForall Keyword
hi! link Conceal User8

setlocal conceallevel=2
setlocal concealcursor=nvc
