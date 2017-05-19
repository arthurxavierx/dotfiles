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
"" netrw
noremap <leader>f\    :Vexplore<CR>

" Buffers
noremap <leader>bb    :ls<CR>
noremap <leader>r     :buffer *
noremap <leader>bf    :buffer *
noremap <leader>bs    :sbuffer *
"" buffer saving
noremap <leader>w     :w<CR>
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

" Location list
nnoremap <silent> <C-j> :lnext<CR>
nnoremap <silent> <C-k> :lprev<CR>

" Quickfix
command! -nargs=+ -complete=file_in_path -bar Vim vim <args> | cw | cfirst
nnoremap <leader>qf :Vim<space>
nnoremap <leader>qq :cw<CR>
nnoremap <leader>qo :copen<CR>
nnoremap <leader>qc :cclose<CR>
"" quickfix navigation
nnoremap <silent> <C-S-j> :cnext<CR>
nnoremap <silent> <C-S-k> :cprev<CR>

" Windows
"" split windows
nmap <leader>sH       :topleft  vsp<CR>
nmap <leader>sL       :botright vsp<CR>
nmap <leader>sK       :topleft  sp<CR>
nmap <leader>sJ       :botright sp<CR>
"" small split
nmap <leader>sh       :leftabove  vsp<CR>
nmap <leader>sl       :rightbelow vsp<CR>
nmap <leader>sk       :leftabove  sp<CR>
nmap <leader>sj       :rightbelow sp<CR>
"" window navigation
nnoremap <leader>h     <C-w>h
nnoremap <leader>l     <C-w>l
nnoremap <leader>k     <C-w>k
nnoremap <leader>j     <C-w>j
"" window resize
nnoremap <silent> <S-up>     :resize +10<CR>
nnoremap <silent> <S-down>   :resize -10<CR>
nnoremap <silent> <S-right>  :vertical resize +10<CR>
nnoremap <silent> <S-left>   :vertical resize -10<CR>
nnoremap <C-W>M              <C-W>\| <C-W>_
nnoremap <C-W>m              <C-W>=

" Terminal mode
if (has("nvim"))
  tnoremap <Esc>         <C-\><C-n>
  tnoremap <C-h>         <C-\><C-n>:bprevious<CR>
  tnoremap <C-l>         <C-\><C-n>:bnext<CR>
endif
