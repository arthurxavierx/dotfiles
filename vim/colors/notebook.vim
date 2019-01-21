" ------------------------------------------------------------------------------
" File:         notebook.vim
" Author:       Arthur Xavier <arthur.xavierx@gmail.com>
" Description:  A color scheme that resembles a notebook colored with
"               highlighters. Inspired by flatwhite-syntax for Atom and
"               https://github.com/kamwitsta/flatwhite-vim.
" License:      GPLv3+
" ------------------------------------------------------------------------------

" Preamble {{{

let g:colors_name = 'notebook'

if version > 580
  if exists('syntax_on')
    syntax reset
  endif
endif
if has('termguicolors')
  set termguicolors
endif
if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

function! s:hi(group, fg, bg, gui)
  let l:res = 'hi ' . a:group
  let l:fg  = s:colors[a:fg]
  let l:bg  = s:colors[a:bg]
  if l:fg != ''
    let l:res = l:res . ' guifg=' . l:fg
  endif
  if l:bg != ''
    let l:res = l:res . ' guibg=' . l:bg
  endif
  if a:gui != ''
    let l:res = l:res . ' gui=' . a:gui
    let l:res = l:res . ' cterm='. a:gui
  endif
  execute l:res
endfunction

" }}}

" Palette {{{

if &background == 'light'
  let s:colors =
    \ { 'default':           ''
    \ , 'base1':             '#605a52'
    \ , 'base2':             '#93836c'
    \ , 'base3':             '#b9a992'
    \ , 'base4':             '#dcd3c6'
    \ , 'base5':             '#e4ddd2'
    \ , 'base6':             '#f1ece4'
    \ , 'base7':             '#f7f3ee'
    \ , 'accent':            '#6a4cff'
    \ , 'orange_text':       '#5b5143'
    \ , 'orange_text_sec':   '#957f5f'
    \ , 'orange_bg':         '#f7e0c3'
    \ , 'green_text':        '#525643'
    \ , 'green_text_sec':    '#81895d'
    \ , 'green_bg':          '#e2e9c1'
    \ , 'teal_text':         '#465953'
    \ , 'teal_text_sec':     '#5f8c7d'
    \ , 'teal_bg':           '#d2ebe3'
    \ , 'blue_text':         '#4c5361'
    \ , 'blue_text_sec':     '#7382a0'
    \ , 'blue_bg':           '#dde4f2'
    \ , 'purple_text':       '#614c61'
    \ , 'purple_text_sec':   '#9c739c'
    \ , 'purple_bg':         '#f1ddf1'
    \ , 'diff_add':          '#2db448'
    \ , 'diff_change':       '#f5e20d'
    \ , 'diff_change_dark':  '#795306'
    \ , 'diff_delete':       '#ff1414'
    \ , 'diff_renamed':      '#52aeff'
    \ }
else
  let s:colors =
    \ { 'default':           ''
    \ , 'base1':             '#f0ebe4'
    \ , 'base2':             '#d4cbbe'
    \ , 'base3':             '#998d7a'
    \ , 'base4':             '#7d7260'
    \ , 'base5':             '#635b4f'
    \ , 'base6':             '#5c554e'
    \ , 'base7':             '#4a4540'
    \ , 'accent':            '#ffa8f4'
    \ , 'orange_bg':         '#69582d'
    \ , 'orange_text_sec':   '#c8b79c'
    \ , 'orange_text':       '#f7e0c3'
    \ , 'green_bg':          '#535944'
    \ , 'green_text_sec':    '#b2bd7b'
    \ , 'green_text':        '#e2e9c1'
    \ , 'teal_bg':           '#39635c'
    \ , 'teal_text_sec':     '#85c1ae'
    \ , 'teal_text':         '#d2ebe3'
    \ , 'blue_bg':           '#4a5585'
    \ , 'blue_text_sec':     '#a1b4d5'
    \ , 'blue_text':         '#dde4f2'
    \ , 'purple_bg':         '#614c61'
    \ , 'purple_text_sec':   '#d1a1d1'
    \ , 'purple_text':       '#f1ddf1'
    \ , 'diff_add':          '#1a9124'
    \ , 'diff_change':       '#c1a704'
    \ , 'diff_change_dark':  '#9f8144'
    \ , 'diff_delete':       '#e80000'
    \ , 'diff_renamed':      '#3282ec'
    \ }
  endif

" }}}

" Definitions {{{

let s:_ = 'default'

call s:hi('ColorColumn',   s:_,                 'base6',        'none')
call s:hi('Comment',       'base3',             'base7',        'italic')
call s:hi('Constant',      'teal_text',         'teal_bg',      'none')
call s:hi('Cursor',        'base7',             s:_,            'none')
call s:hi('CursorLine',    s:_,                 'base6',        'none')
call s:hi('DiffAdd',       'base7',             'diff_add',     'none')
call s:hi('DiffChange',    'base1',             'diff_change',  'none')
call s:hi('DiffDelete',    'base7',             'diff_delete',  'none')
call s:hi('EndOfBuffer',   'base7',             'base7',        'none')
call s:hi('FoldColumn',    'base5',             'base7',        'none')
call s:hi('Folded',        'base3',             'base5',        'none')
call s:hi('Function',      'blue_text',         'blue_bg',      'none')
call s:hi('Ignore',        'base4',             'base7',        'none')
call s:hi('LineNr',        'base5',             'base7',        'none')
call s:hi('MatchParen',    'accent',            'base7',        'underline')
call s:hi('ModeMsg',       'teal_text',         'teal_bg',      'bold')
call s:hi('Normal',        'base1',             'base7',        'none')
call s:hi('Search',        s:_,                 'diff_change',  'underline')
call s:hi('SpellBad',      s:_,                 s:_,            'underline')
call s:hi('SpellRare',     'diff_change_dark',  'diff_change',  'none')
call s:hi('Statement',     'purple_text',       'purple_bg',    'none')
call s:hi('Pmenu',         'base3',             'base6',        'none')
call s:hi('PmenuSel',      'base1',             'base4',        'none')
call s:hi('StatusLine',    'blue_text',         'base7',        'none')
call s:hi('String',        'green_text',        'green_bg',     'none')
call s:hi('Todo',          'base1',             'base7',        'bold')
call s:hi('Type',          'orange_text',       'orange_bg',    'none')
call s:hi('Underlined',    'blue_text_sec',     s:_,            'underline')
call s:hi('Visual',        s:_,                 'base4',        'none')

call s:hi('User1',         'blue_text',         'base7',        'none')
call s:hi('User2',         'green_text_sec',    'base7',        'none')
call s:hi('User3',         'purple_text_sec',   'base7',        'none')
call s:hi('User4',         'orange_text_sec',   'base7',        'none')
call s:hi('User9',         'base2',             'base6',        'bold')

hi! link Boolean             Constant
hi! link Character           String
hi! link Conceal             Normal
hi! link Conditional         Statement
hi! link CursorColumn        CursorLine
hi! link CursorIM            Cursor
hi! link CursorLineNr        Normal
hi! link Debug               Special
hi! link Define              PreProc
hi! link Delimiter           Special
hi! link DiffText            Normal
hi! link Directory           Type
hi! link Error               DiffDelete
hi! link ErrorMsg            Error
hi! link Exception           Statement
hi! link Float               Constant
hi! link Identifier          Normal
hi! link IncSearch           Search
hi! link Include             PreProc
hi! link Keyword             Statement
hi! link Label               Statement
hi! link Macro               PreProc
hi! link MoreMsg             Visual
hi! link NonText             Ignore
hi! link Number              Constant
hi! link Operator            Normal
hi! link PmenuSbar           Pmenu
hi! link PmenuThumb          PmenuSel
hi! link PreCondit           PreProc
hi! link PreProc             Type
hi! link Question            ModeMsg
hi! link Repeat              Statement
hi! link Scrollbar           PmenuSbar
hi! link SignColumn          FoldColumn
hi! link Special             Normal
hi! link SpecialChar         Special
hi! link SpecialComment      Special
hi! link SpecialKey          Special
hi! link SpellCap            SpellBad
hi! link SpellLocal          SpellRare
hi! link StatusLineNC        LineNr
hi! link StorageClass        Type
hi! link Structure           Type
hi! link TabLine             Pmenu
hi! link TabLineFill         Normal
hi! link TabLineSel          PmenuSel
hi! link Tag                 Special
hi! link Title               Statement
hi! link Typedef             Type
hi! link VertSplit           LineNr
hi! link VisualNOS           Visual
hi! link WarningMsg          DiffChange
hi! link WildMenu            Pmenu

" css {{{
hi! link cssBraces           Delimiter
" }}}

" git {{{
call s:hi('diffAdded',     'green_text',        'green_bg',     'none')
call s:hi('diffRemoved',   'orange_text',       'orange_bg',    'none')
hi! link diffSubname         Function
" }}}

" haskell {{{
hi! link haskellBacktick       Function
hi! link haskellBottom         Keyword
hi! link haskellDecl           Keyword
hi! link haskellDeclKeyword    Keyword
hi! link haskellIdentifier     Function
hi! link haskellImportKeywords Keyword
hi! link haskellLet            Keyword
hi! link haskellWhere          Keyword
" }}}

" help {{{
hi! link helpHyperTextJump   Keyword
" }}}

" html {{{
hi! link htmlTag             Normal
hi! link htmlHead            Normal
hi! link htmlTitle           Normal
" }}}

" idris {{{
hi! link idrisStructure      Keyword
hi! link idrisWhere          Keyword
" }}}

" javascript {{{
hi! link jsArrowFunction     Normal
hi! link jsClassMethodType   Statement
hi! link jsExport            Statement
hi! link jsExportDefault     Statement
hi! link jsFrom              Statement
hi! link jsFunction          Statement
hi! link jsImport            Statement
hi! link jsModuleAs          Statement
hi! link jsNull              Statement
hi! link jsStorageClass      Statement
" }}}

" makefile {{{
hi! link makeIdent           Constant
hi! link makeCommands        Normal
" }}}

" markdown {{{
hi! link mkdHeading           Statement
" }}}

" purescript {{{
hi! link purescriptBacktick  Function
hi! link purescriptConstructorDecl Normal
hi! link purescriptHole      Function
" }}}

" quickfix {{{
hi! link qfFileName          Underlined
hi! link QuickFixLine        PmenuSel
" }}}

" sql {{{
hi! link sqlKeyword          Keyword
hi! link sqlSpecial          Type
" }}}

" tmux {{{
hi! link tmuxKey             Type

" vim {{{
hi! link vimIsCommand        Statement
hi! link vimSetSep           vimSetEqual
" }}}

" vimwiki {{{
hi! link VimwikiCode         String
hi! link VimwikiCodeChar     String
" }}}

" }}}
" vim:fdm=marker:fdl=0:
