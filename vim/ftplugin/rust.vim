let g:ale_rust_rls_toolchain = 'stable'
let g:ale_linters.rust = ['rls']

" if (filereadable("./Cargo.toml") == 1)
"   let g:ale_linters.rust = ['rls', 'cargo']
" else
"   let g:ale_linters.rust = ['rls', 'rustc']
" endif
