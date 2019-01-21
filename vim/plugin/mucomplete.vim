let g:mucomplete#enable_auto_at_startup = 0
let g:mucomplete#minimum_prefix_length = 2

let g:mucomplete#user_mappings = {
  \ 'sym': "\<c-r>=CompleteSymbols()\<cr>"
  \ }

let g:mucomplete#chains = {
  \ 'default': ['path', 'user', 'ulti', 'c-n', 'omni', 'uspl'],
  \ 'vim': ['path', 'user', 'ulti', 'c-n', 'omni', 'uspl'],
  \ 'sql': ['path', 'user', 'ulti', 'c-n', 'uspl'],
  \ 'tex': ['path', 'user', 'c-n', 'incl', 'uspl'],
  \ 'javascript': ['path', 'user', 'c-n', 'incl', 'uspl', 'omni'],
  \ 'javascript.jsx': ['path', 'user', 'c-n', 'incl', 'uspl', 'omni'],
  \ }
