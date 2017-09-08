let mapleader = "\<SPACE>"

set pastetoggle=<F3>

" Shortcut for commands
noremap ; :
" Use ç as next-find
noremap ç ;
" Shortcut for searching
noremap \ /
" Yank to end of line
nnoremap Y y$
" Disable ex mode
nnoremap Q @q
" Disable man page
nnoremap K <nop>

" . repeat in visual mode
vnoremap <silent> .   :norm.<CR>

" Clear highlighting on escape in normal mode
nnoremap <silent> <esc> :noh<CR><esc>

" Project
noremap <leader>pm    :wa<bar>make<CR>
noremap <leader>pM    :wa<bar>make<space>--<space>

" Buffers
noremap <C-h>         :bprev<CR>
noremap <C-l>         :bnext<CR>

" Files
noremap <leader>t     :find *
noremap <leader>ff    :find *
noremap <leader>fw    :w<CR>

noremap <leader>gf    :Gf<CR>

" netrw
map <buffer> <leader>\ <Plug>VinegarUp
"" map o to <CR> in netrw
autocmd filetype netrw map <buffer> o <CR>
autocmd filetype netrw map <buffer> <leader>\ :e #<CR>

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

"" vim-commentary
map <leader>;         gcc

" Quickfix and Location list
noremap <leader>lo    :Lopen<CR>
noremap <leader>lc    :Lclose<CR>
noremap <leader>lw    :Lwin<CR>
noremap <leader>ll    :Llist<CR>

"" quickfix and location list navigation
noremap <C-j>         :Lnext<CR>
noremap <C-k>         :Lprev<CR>

"" list search
map <leader>lf :Vims<space>
map <silent> <leader>lgg :execute "Vims " . expand("<cword>")<CR>
map <silent> <leader>lgc :execute "VimsC " . expand("<cword>")<CR>

" Windows
"" split windows
noremap <leader>sH       :topleft  vsp<CR>
noremap <leader>sL       :botright vsp<CR>
noremap <leader>sK       :topleft  sp<CR>
noremap <leader>sJ       :botright sp<CR>

"" small split
noremap <leader>sh       :leftabove  vsp<CR>
noremap <leader>sl       :rightbelow vsp<CR>
noremap <leader>sk       :leftabove  sp<CR>
noremap <leader>sj       :rightbelow sp<CR>

"" window resize
noremap <silent> <S-up>     :resize +10<CR>
noremap <silent> <S-down>   :resize -10<CR>
noremap <silent> <S-right>  :vertical resize +10<CR>
noremap <silent> <S-left>   :vertical resize -10<CR>
noremap <C-w>m              <C-W>\|<C-W>_
noremap <C-w>=              <C-W>=

" Terminal mode
if (has("nvim"))
  tnoremap <Esc>         <C-\><C-n>
  tnoremap <C-h>         <C-\><C-n>:bprevious<CR>
  tnoremap <C-l>         <C-\><C-n>:bnext<CR>
endif
