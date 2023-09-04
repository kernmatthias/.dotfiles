local cmp = require('cmp')

cmp.setup({
    snippet = {
    },
    mapping = cmp.mapping.preset.insert({
        ['<tab>'] = cmp.mapping.confirm({ select = true }),
    }),
    formatting = {
        format = function(entry, vim_item)
            print(entry)
            print(vim_item)
        end,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
    }
})

