let g:lightline#bufferline#show_number = 1
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline#bufferline#unnamed = '[No Name]'

let g:lightline = {
      \   'colorscheme': 'deus',
      \   'active': {
      \     'left':[ [ 'mode', 'paste' ],
      \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
      \     ]
      \   },
      \   'component': {
      \     'lineinfo': ' %3l:%-2v',
      \   },
      \ }

let g:lightline.tabline = {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['tabs'] ],
      \ }

let g:lightline.separator = {
      \   'left': '', 'right': ''
      \ }

let g:lightline.subseparator = {
      \   'left': '', 'right': ''
      \ }

let g:lightline.component_expand = { 'buffers': 'lightline#bufferline#buffers' }
let g:lightline.component_type   = { 'buffers': 'tabsel' }

set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline
