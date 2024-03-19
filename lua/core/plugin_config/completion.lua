local cmp = require('cmp')

cmp.setup({
  mappings = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-o>'] = cmp.mapping.complete(),
    ['<C-a>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({select = true})
  }),
  sources = cmp.config.sources(
    {{name = 'nvim_lsp'}},
    {{name = 'buffer'}}
  )
})
