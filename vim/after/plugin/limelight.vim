if !exists(':Limelight')
  finish
endif

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = synIDattr(hlID('Normal'), 'bg')

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1
