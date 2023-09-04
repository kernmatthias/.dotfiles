local rt = require("rust-tools")
local remap = require('user.keymap')

rt.setup({
	server = {
		on_attach = function(_, bufnr)
            remap.nnoremap("gd", vim.lsp.buf.definition)
            remap.nnoremap("gh", rt.hover_actions.hover_actions, { buffer = bufnr })
            remap.nnoremap("<leader>od", vim.diagnostic.open_float)
            remap.nnoremap("<leader>nd", vim.diagnostic.goto_next)
            remap.nnoremap("<leader>pd", vim.diagnostic.goto_prev)
            remap.nnoremap("<leader>ca", rt.code_action_group.code_action_group, { buffer = bufnr })
            remap.nnoremap("<leader>rr", vim.lsp.buf.references)
            remap.nnoremap("<leader>rn", vim.lsp.buf.rename)
            remap.nnoremap("<C-h>", vim.lsp.buf.signature_help)
		end,
	},
})

