let mapleader = "\<SPACE>"

set pastetoggle=<F3>

" Shortcut for commands
noremap ; :
" Use ç as next-find
noremap ç ;
" Shortcut for searching
noremap \ /

" . repeat in visual mode
vnoremap <silent> .   :norm.<CR>

" Clear highlighting on escape in normal mode
nnoremap <silent> <esc> :noh<CR><esc>

" Buffers
noremap <C-h>         :bprev<CR>
noremap <C-l>         :bnext<CR>

" Files
noremap <leader>t     :find *
noremap <leader>ff    :find *
noremap <leader>fw    :w<CR>
"" netrw
noremap <leader>f\    :Vexplore<CR>

" Buffers
noremap <leader>bb    :ls<CR>
noremap <leader>r     :buffer *
noremap <leader>bf    :buffer *
noremap <leader>bs    :sbuffer *
"" buffer saving
noremap <leader>bw    :w<CR>
""  buffer closing
noremap <leader>bc    :Kwbd<CR>
noremap  <C-Q>        :Kwbd<CR>

" Plugins {{{
"" NERDCommenter
map <leader>;         <Plug>NERDCommenterToggle
"" vim-expand-region
vmap v                <Plug>(expand_region_expand)
vmap V                <Plug>(expand_region_shrink)
" }}}

" Quickfix and Location list
noremap <leader>lo    :Lopen<CR>
noremap <leader>lc    :Lclose<CR>
noremap <leader>lw    :Lwin<CR>
"" quickfix and location list navigation
noremap <C-j>         :Lnext<CR>
noremap <C-k>         :Lprev<CR>
"" list search
map <leader>lf :Vims<space>
map <silent> <leader>lg :execute "Vims " . expand("<cword>")<CR>

" Windows
"" split windows
noremap <leader>wsH      :topleft  vsp<CR>
noremap <leader>wsL      :botright vsp<CR>
noremap <leader>wsK      :topleft  sp<CR>
noremap <leader>wsJ      :botright sp<CR>
"" small split
noremap <leader>wsh      :leftabove  vsp<CR>
noremap <leader>wsl      :rightbelow vsp<CR>
noremap <leader>wsk      :leftabove  sp<CR>
noremap <leader>wsj      :rightbelow sp<CR>
"" window navigation
noremap <leader>wh   <C-w>h
noremap <leader>wl   <C-w>l
noremap <leader>wk   <C-w>k
noremap <leader>wj   <C-w>j
"" window resize
noremap <silent> <S-up>     :resize +10<CR>
noremap <silent> <S-down>   :resize -10<CR>
noremap <silent> <S-right>  :vertical resize +10<CR>
noremap <silent> <S-left>   :vertical resize -10<CR>
noremap <C-W>M              <C-W>\| <C-W>_

" Terminal mode
if (has("nvim"))
  tnoremap <Esc>         <C-\><C-n>
  tnoremap <C-h>         <C-\><C-n>:bprevious<CR>
  tnoremap <C-l>         <C-\><C-n>:bnext<CR>
endif
