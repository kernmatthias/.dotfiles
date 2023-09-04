local lsp = require("lsp-zero")
local lspconfig = require('lspconfig')

lsp.preset("recommended")

lsp.setup_servers({
	'lua_ls',
	'rust_analyzer',
	'ccls',
	'tsserver',
	'cssls',
	'astro',
	'tailwindcss',
	'gopls',
	'jedi_language_server',
	'texlab',
	'ltex',
	'bashls',
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true }),
	['<C-Space>'] = cmp.mapping.complete(),
})

-- cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.configure('lua_ls', {
	root_dir = lspconfig.util.root_pattern({ 'init.vim', '.git' }),
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
				path = vim.split(package.path, ';'),
				--[[
                path = {
                    '?.lua',
                    '?/init.lua',
                },
                --]]
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim', 'awesome' },
				neededFileStatus = {
					['codestyle-check'] = 'Any',
				},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
			format = {
				enable = true,
				defaultConfig = {
					indent_style = 'space',
					indent_size = '4',
				},
			},
		},
	},
})


lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = 'E',
		warn  = 'W',
		hint  = 'H',
		info  = 'I',
	},
})

lsp.on_attach(function(_, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<leader>od", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "<leader>nd", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "<leader>pd", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

lsp.nvim_workspace()
lsp.setup()

vim.diagnostic.config({
	virtual_text = true
})
