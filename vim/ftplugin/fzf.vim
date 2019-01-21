" Hide status line on FZF
set laststatus=0 noshowmode noruler
autocmd BufLeave <buffer> set laststatus=2

" Close with <Esc>
tnoremap <silent> <buffer><nowait> <Esc> <C-c>
