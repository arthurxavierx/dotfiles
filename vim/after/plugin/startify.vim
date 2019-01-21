if !exists('g:loaded_startify')
  finish
endif

let g:startify_lists = [
      \ { 'type': 'dir', 'header': ['   MRU '. getcwd()] },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks'] },
      \ { 'type': 'commands', 'header': ['   Commands'] },
      \ ]

let g:startify_relative_path = 1
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 0
let g:startify_fortune_use_unicode = 1
