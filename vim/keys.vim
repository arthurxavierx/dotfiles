let mapleader = "\<SPACE>"

set pastetoggle=<F3>

noremap ; :
noremap ç ;
noremap \ /

" Yank to end of line
nnoremap Y y$
" Disable ex mode and man page
nnoremap Q <nop>
nnoremap K <nop>

" . repeat in visual mode
vnoremap <silent> .   :norm.<CR>

" Clear highlighting on escape in normal mode
nnoremap <silent> <esc> :noh<CR><esc>

" Moving with hjkl in insert mode
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l

" Make {{{
noremap <leader>pm    :wa<bar>make<CR>
noremap <leader>pM    :wa<bar>make<space>--<space>
" }}}

" Buffers {{{
noremap <C-h>         :bprev<CR>
noremap <C-l>         :bnext<CR>
noremap <leader>r     :buffer *
noremap <silent> <C-q> :Kwbd<CR>
" }}}

" Files {{{
noremap <leader>t     :find *
noremap <leader>w     :w<CR>
"" go-to-file without wildignore
noremap <leader>gf    :Gf<CR>
" }}}

" Find {{{
noremap <leader>ff    :find *
noremap <leader>fb    :buffer *
noremap <leader>fa    :Vims<space>
noremap <leader>fl    :Vim<space>
noremap <leader>fw    :execute "Vims \\<" . expand("<cword>") . "\\>"<CR>
noremap <leader>fW    :execute "VimsC \\<" . expand("<cword>") . "\\>"<CR>
" }}}

" netrw {{{
map <leader>\ <Plug>VinegarUp
"" map o to <CR> in netrw
autocmd filetype netrw map <buffer> o <CR>
autocmd filetype netrw map <buffer> <leader>\ :e #<CR>
" }}}

" Windows {{{
"" resize
noremap <silent> <S-up>     :resize +10<CR>
noremap <silent> <S-down>   :resize -10<CR>
noremap <silent> <S-right>  :vertical resize +10<CR>
noremap <silent> <S-left>   :vertical resize -10<CR>
" }}}

" Terminal mode {{{
if (has("nvim"))
  tnoremap <Esc>         <C-\><C-n>
  tnoremap <C-h>         <C-\><C-n>:bprevious<CR>
  tnoremap <C-l>         <C-\><C-n>:bnext<CR>
endif
" }}}
