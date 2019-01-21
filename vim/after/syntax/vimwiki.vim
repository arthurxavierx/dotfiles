syntax match VimwikiListTodo '\v-\s+\[\s\]' conceal cchar=☐
syntax match VimwikiListTodo '\v-\s+\[X\]' conceal cchar=☒

setlocal conceallevel=2
