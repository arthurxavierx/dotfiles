set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline

let g:lightline#bufferline#show_number = 1
let g:lightline#bufferline#shorten_path = 1
let g:lightline#bufferline#filename_modifier = ':.'
let g:lightline#bufferline#unnamed = '[No Name]'

let g:lightline = {
      \   'colorscheme': 'deus',
      \   'active': {
      \     'left':[ [ 'mode', 'paste' ],
      \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
      \     ]
      \   },
      \   'tabline': {
      \     'left': [ ['buffers'] ],
      \     'right': [ ['tabs'] ],
      \   },
      \   'component_expand': { 'buffers': 'lightline#bufferline#buffers' },
      \   'component_type': { 'buffers': 'tabsel' },
      \   'component_function': {
      \     'filename': 'LightlineFilename',
      \   }
      \ }

function! LightlineFilename()
  let path = expand('%:.')
  return len(path) > 50 ? '...'.path[-45:] : path
endfunction
