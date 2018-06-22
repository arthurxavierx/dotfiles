let mapleader = "\<space>"
nnoremap <space> <nop>

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

" Make {{{
nnoremap m<CR>        :wa<bar>make<CR>
nnoremap m<space>     :wa<bar>make<space>--<space>
" }}}

" Buffers {{{
noremap <C-h>         :bprev<CR>
noremap <C-l>         :bnext<CR>
noremap <leader>r     :Buffers<CR>
noremap <silent> <C-q> :Kwbd<CR>
" }}}

" Files {{{
noremap <leader>t     :Files<CR>
noremap <leader>w     :w<CR>
"" go-to-file without wildignore
noremap <leader>gf    :Gf<CR>
" }}}

" Find {{{
noremap <leader>ff    :Files<CR>
noremap <leader>fb    :Buffers<CR>
noremap <leader>fa    :Ag<CR>
noremap <leader>fl    :Lines<CR>
noremap <leader>f'    :Marks<CR>
noremap <leader>f"    :Marks<CR>
noremap <leader>fm    :Maps<CR>
noremap <leader>fh    :History<CR>
noremap <leader><leader> :Commands<CR>
" }}}

" netrw {{{
map <leader>\ <Plug>VinegarUp
map <leader>z <Plug>VinegarUp
"" map o to <CR> in netrw
autocmd filetype netrw map <buffer> o <CR>
autocmd filetype netrw map <buffer> <leader>\ :e #<CR>
autocmd filetype netrw map <buffer> <leader>z :e #<CR>
" }}}

" Windows {{{
"" resize
noremap <silent> <S-up>     :resize +5<CR>
noremap <silent> <S-down>   :resize -5<CR>
noremap <silent> <S-right>  :vertical resize +5<CR>
noremap <silent> <S-left>   :vertical resize -5<CR>
noremap <C-w>m              <C-w>\|<C-w>_
noremap <C-w><C-m>          <C-w>\|<C-w>_
" }}}

" Terminal mode {{{
if (has("nvim"))
  tnoremap <Esc>         <C-\><C-n>
  tnoremap <C-h>         <C-\><C-n>:bprevious<CR>
  tnoremap <C-l>         <C-\><C-n>:bnext<CR>
endif
" }}}
