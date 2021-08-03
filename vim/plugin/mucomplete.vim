let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#minimum_prefix_length = 2

let g:mucomplete#user_mappings = {
  \ 'sym': "\<Plug>SymbolsComplete"
  \ }

let g:mucomplete#chains = {
  \ 'default': ['path', 'user', 'c-n', 'omni', 'dict', 'uspl', 'ulti'],
  \ 'vim': ['path', 'user', 'c-n', 'omni', 'uspl', 'ulti'],
  \ 'sql': ['path', 'c-n', 'uspl', 'ulti'],
  \ 'tex': ['path', 'c-n', 'incl', 'uspl'],
  \ 'javascript': ['path', 'c-n', 'incl', 'uspl', 'omni'],
  \ 'javascript.jsx': ['path', 'c-n', 'incl', 'uspl', 'omni'],
  \ 'haskell': ['path', 'c-n', 'dict', 'uspl', 'ulti'],
  \ 'purescript': ['path', 'c-n', 'dict', 'uspl', 'ulti']
  \ }
