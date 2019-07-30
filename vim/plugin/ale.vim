let g:ale_sign_error = '»'
let g:ale_sign_warning = '!'

let g:ale_open_list = 1
let g:ale_keep_list_window_open = 1

" Lint
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_save = 1

let g:ale_linters = {'jsx': ['stylelint', 'eslint']}
let g:ale_linter_aliases = {'jsx': 'css'}

" Fix
let g:ale_fix_on_save = 1

let g:ale_fixers =
      \ { '*': ['remove_trailing_lines', 'trim_whitespace']
      \ }

" Complete
let g:ale_completion_enabled = 1
