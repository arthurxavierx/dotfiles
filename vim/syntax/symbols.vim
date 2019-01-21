if exists("b:current_syntax")
  finish
endif

let b:current_syntax = "symbols"

syntax match symbolsNames /[^:]\+:/me=e-1
syntax match symbolsSymbol /:.*$/ms=s+1
syntax match symbolsComment /^\s*".*/

hi! link symbolsComment Comment
hi! link symbolsNames String
hi! link symbolsSymbol Normal
