let mapleader = "\<SPACE>"

nnoremap ; :
nnoremap ç ;
nnoremap \ /
nnoremap <leader>w :w<CR>
nnoremap <C-w>     :bd<CR>

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

map <down> gj
map <up> gk

" Open file
nmap <leader>ew       :e<SPACE>
nmap <leader>ee       :e<SPACE>

" Buffers
nmap <leader>en       :enew<CR>
nnoremap <C-h>        :bprevious<CR>
nnoremap <C-l>        :bnext<CR>

" CtrlP
nnoremap <leader>t    :CtrlP<CR>
nnoremap <leader>r    :CtrlPBufTag<CR>
nnoremap <leader>b    :CtrlPBuffer<CR>

" NERDTree
noremap <leader>\     :NERDTreeToggle<CR>

" Tagbar
noremap <leader>]     :TagbarToggle<CR>

" Open file in new window
nmap <leader>eH       :topleft  vsp<SPACE>
nmap <leader>eL       :botright vsp<SPACE>
nmap <leader>eK       :topleft  sp<SPACE>
nmap <leader>eJ       :botright sp<SPACE>

nmap <leader>eh       :leftabove  vsp<SPACE>
nmap <leader>el       :rightbelow vsp<SPACE>
nmap <leader>ek       :leftabove  sp<SPACE>
nmap <leader>ej       :rightbelow sp<SPACE>

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

" Terminal mode
if (has("nvim"))
  tnoremap <Esc>         <C-\><C-n>
  tnoremap <C-h>         <C-\><C-n>:bprevious<CR>
  tnoremap <C-l>         <C-\><C-n>:bnext<CR>
endif
