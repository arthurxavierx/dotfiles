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
command! -nargs=+ -complete=file_in_path -bar Grep grep <args> | cw | cfirst
command! -nargs=+ -complete=file_in_path -bar Vim  vim  <args> | cw | cfirst
noremap <leader>lf :Vim<space>

" Windows
"" split windows
nmap <leader>wsH      :topleft  vsp<CR>
nmap <leader>wsL      :botright vsp<CR>
nmap <leader>wsK      :topleft  sp<CR>
nmap <leader>wsJ      :botright sp<CR>
"" small split
nmap <leader>wsh      :leftabove  vsp<CR>
nmap <leader>wsl      :rightbelow vsp<CR>
nmap <leader>wsk      :leftabove  sp<CR>
nmap <leader>wsj      :rightbelow sp<CR>
"" window navigation
nnoremap <leader>wh   <C-w>h
nnoremap <leader>wl   <C-w>l
nnoremap <leader>wk   <C-w>k
nnoremap <leader>wj   <C-w>j
"" window resize
nnoremap <silent> <S-up>     :resize +10<CR>
nnoremap <silent> <S-down>   :resize -10<CR>
nnoremap <silent> <S-right>  :vertical resize +10<CR>
nnoremap <silent> <S-left>   :vertical resize -10<CR>
nnoremap <C-W>M              <C-W>\| <C-W>_

" Terminal mode
if (has("nvim"))
  tnoremap <Esc>         <C-\><C-n>
  tnoremap <C-h>         <C-\><C-n>:bprevious<CR>
  tnoremap <C-l>         <C-\><C-n>:bnext<CR>
endif
