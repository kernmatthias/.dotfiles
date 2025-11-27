local configs = require("lspconfig.configs")
-- local cmp = require('cmp')
local coq = require("coq")
local remap = require("user.keymap")
local lspkind = require("lspkind")
-- local ih = require("inlay-hints")
local mason = require("mason")

mason.setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- ih.setup()

local source_mapping = {
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	-- cmp_tabnine = "[TN]",
	path = "[Path]",
}

require("fidget").setup()

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		remap.nnoremap("gd", vim.lsp.buf.definition)
		remap.nnoremap("gD", vim.lsp.buf.declaration)
		remap.nnoremap("<leader>gi", vim.lsp.buf.implementation)
		remap.nnoremap("<leader>gd", vim.lsp.buf.type_definition)
		remap.nnoremap("gh", function()
			vim.lsp.buf.hover({ border = "rounded" })
		end)
		remap.nnoremap("<leader>od", vim.diagnostic.open_float)
		remap.nnoremap("<leader>nd", function()
			vim.diagnostic.jump({ count = 1, float = true })
		end)
		remap.nnoremap("<leader>pd", function()
			vim.diagnostic.jump({ count = -1, float = true })
		end)
		remap.nnoremap("<leader>ca", vim.lsp.buf.code_action)
		remap.nnoremap("<leader>rr", vim.lsp.buf.references)
		remap.nnoremap("<leader>rn", vim.lsp.buf.rename)
		remap.nnoremap("<C-h>", vim.lsp.buf.signature_help)
	end,
})
--[[
cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
	}),
	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = lspkind.presets.default[vim_item.kind]
			local menu = source_mapping[entry.source.name]
			-- if entry.source.name == "cmp_tabnine" then
			-- 	if entry.completion_item.data ~= nil and entry.completion_item.datail ~= nil then
			-- 		menu = entry.completion_item.data.detail .. " " .. menu
			-- 	end
			-- 	vim_item.kind = ""
			-- end
			vim_item.menu = menu
			return vim_item
		end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "luasnip" },
		-- { name = "cmp_tabnine" },
		{ name = "buffer" },
	},
	experimental = {
		ghost_text = false,
	}
})
--]]

-- local tabnine = require('cmp_tabnine.config')
-- tabnine:setup({
-- 	max_lines = 1000,
-- 	max_num_results = 20,
-- 	sort = true,
-- 	run_on_every_keystroke = true,
-- 	snippet_placeholder = "..",
-- })

vim.lsp.config("lua_ls", {
	root_dir = function(bufnr, on_dir)
		if vim.fs.root(bufnr, { "init.vim", ".git" }) then
			on_dir(vim.fn.getcwd())
		end
	end,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				path = vim.split(package.path, ";"),
				--[[
				path = {
					'?.lua',
					'?/init.lua',
				},
				--]]
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim", "awesome" },
				neededFileStatus = {
					["codestyle-check"] = "Any",
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
					indent_style = "tab",
					indent_size = "4",
				},
			},
		},
	},
})
vim.lsp.enable("lua_ls")

-- rust use rust-tools
vim.lsp.config("rust_analyzer", {
	settings = {
		["rust-analyzer"] = {
			diagnostics = {
				enable = false,
			},
		},
	},
})

-- c/c++
-- remove cuda support from clangd
vim.lsp.config("clangd", { filetypes = { "c", "cpp", "objc", "objcpp", "proto", "arduino" } })
vim.lsp.enable("clangd")

-- only use ccls for cuda
vim.lsp.config("ccls", { filetypes = { "cuda" } })
vim.lsp.enable("ccls")

-- lsp.arduino_language_server.setup(config({}))

-- javascript/typescript
vim.lsp.enable("ts_ls")

-- astrojs
vim.lsp.enable("astro")

-- tailwindcss language server
vim.lsp.enable("tailwindcss")

-- go
vim.lsp.config("gopls", {
	cmd = { "gopls", "serve" },
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
})
vim.lsp.enable("gopls")

-- python
-- lsp.jedi_language_server.setup(config())
-- lsp.pylsp.setup(config({}))
-- lsp.pyright.setup(config({}))
vim.lsp.enable("basedpyright")

-- css
vim.lsp.enable("cssls")

-- tailwindcss
-- lsp.tailwindcss.setup(config({}))

-- latex
vim.lsp.enable("texlab")

vim.lsp.enable("ltex_plus")

-- vhdl
-- lsp.ghdl_ls.setup(config({}))
vim.lsp.enable("vhdl_ls")

-- bash
vim.lsp.enable("bashls")

-- ocaml
vim.lsp.enable("ocamllsp")

-- systemverilog
vim.lsp.enable("verible")

-- xml
vim.lsp.enable("lemminx")
