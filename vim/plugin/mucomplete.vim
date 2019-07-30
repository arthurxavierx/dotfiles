let g:mucomplete#enable_auto_at_startup = 0
let g:mucomplete#minimum_prefix_length = 2

let g:mucomplete#user_mappings = {
  \ 'sym': "\<Plug>SymbolsComplete"
  \ }

let g:mucomplete#chains = {
  \ 'default': ['path', 'ulti', 'user', 'c-n', 'omni', 'dict', 'uspl'],
  \ 'vim': ['path', 'ulti', 'user', 'c-n', 'omni', 'uspl'],
  \ 'sql': ['path', 'ulti', 'c-n', 'uspl'],
  \ 'tex': ['path', 'c-n', 'incl', 'uspl'],
  \ 'javascript': ['path', 'c-n', 'incl', 'uspl', 'omni'],
  \ 'javascript.jsx': ['path', 'c-n', 'incl', 'uspl', 'omni'],
  \ 'purescript': ['path', 'ulti', 'c-n', 'dict', 'uspl']
  \ }
