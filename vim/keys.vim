let mapleader = "\<SPACE>"

set pastetoggle=<F3>

noremap ; :
noremap ç ;
noremap \ /
noremap <leader>w     :w<CR>
noremap <C-Q>         :Kwbd<CR>

" Clear highlighting on escape in normal mode
nnoremap <esc>        :noh<return><esc>
nnoremap <esc>^[      <esc>^[

map <down> gj
map <up> gk

" Buffers
nnoremap <C-h>        :bprev<CR>
nnoremap <C-l>        :bnext<CR>

" CtrlP
nnoremap <leader>t    :CtrlP<CR>
nnoremap <leader>r    :CtrlPBuffer<CR>
noremap  <F5>         :CtrlPClearCache<CR>

" NERDTree
noremap <leader>\     :NERDTreeToggle<CR>

" NERDCommenter
map <leader>;         <Plug>NERDCommenterToggle

" vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)

" New split window
nmap <leader>sH       :topleft  vsp<CR>
nmap <leader>sL       :botright vsp<CR>
nmap <leader>sK       :topleft  sp<CR>
nmap <leader>sJ       :botright sp<CR>

nmap <leader>sh       :leftabove  vsp<CR>
nmap <leader>sl       :rightbelow vsp<CR>
nmap <leader>sk       :leftabove  sp<CR>
nmap <leader>sj       :rightbelow sp<CR>

" Window navigation
nnoremap <leader>h     <C-w>h
nnoremap <leader>l     <C-w>l
nnoremap <leader>k     <C-w>k
nnoremap <leader>j     <C-w>j

" Window resize
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
