local neogit = require('neogit')

neogit.setup {
    kind = "vsplit",
    integration = {
        diffview = true,
    },
}

local nnoremap = require('Matthias.keymap').nnoremap

nnoremap("<leader>gs", function()
    neogit.open({})
end)

nnoremap("<leader>gf", "<cmd>!git fetch<CR>")

