" lua << EOF
" require'lspconfig'.purescriptls.setup {
"   on_attach = on_attach,
"   settings = {
"     purescript = {
"       addSpagoSources = true,
"       addNpmPath = true,
"       pscIdePort = 2000,
"       outputDirectory = '../output',
"     }
"   },
"   flags = {
"     debounce_text_changes = 150,
"   }
" }
" EOF
