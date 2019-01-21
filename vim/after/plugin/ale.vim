if !exists('g:loaded_ale')
  finish
endif

let g:ale_sign_error = '»'
let g:ale_sign_warning = '!'

let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0
let g:ale_open_list = 1

let g:ale_linters = {'jsx': ['stylelint', 'eslint']}
let g:ale_linter_aliases = {'jsx': 'css'}

let g:ale_fixers = {'javascript': ['prettier']}
let g:ale_javascript_prettier_use_local_config = 1
