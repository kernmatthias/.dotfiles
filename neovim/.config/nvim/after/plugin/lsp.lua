local lsp = require('lspconfig')
local configs = require('lspconfig.configs')
local cmp = require('cmp')
local remap = require('user.keymap')
local lspkind = require('lspkind')
-- local ih = require("inlay-hints")

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

local border = {
	{ "╭", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "╮", "FloatBorder" },
	{ "│", "FloatBorder" },
	{ "╯", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "╰", "FloatBorder" },
	{ "│", "FloatBorder" },
}

local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
}

local function config(_config)
	return vim.tbl_deep_extend("force", {
		--capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
		on_attach = function( --[[c, b]])
			--ih.on_attach(c, b)
			remap.nnoremap("gd", vim.lsp.buf.definition)
			remap.nnoremap("<leader>gd", vim.lsp.buf.type_definition)
			remap.nnoremap("gh", vim.lsp.buf.hover)
			remap.nnoremap("<leader>od", vim.diagnostic.open_float)
			remap.nnoremap("<leader>nd", vim.diagnostic.goto_next)
			remap.nnoremap("<leader>pd", vim.diagnostic.goto_prev)
			remap.nnoremap("<leader>ca", vim.lsp.buf.code_action)
			remap.nnoremap("<leader>rr", vim.lsp.buf.references)
			remap.nnoremap("<leader>rn", vim.lsp.buf.rename)
			remap.nnoremap("<C-h>", vim.lsp.buf.signature_help)
		end,
		handlers = handlers,
	}, _config or {})
end

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

-- local tabnine = require('cmp_tabnine.config')
-- tabnine:setup({
-- 	max_lines = 1000,
-- 	max_num_results = 20,
-- 	sort = true,
-- 	run_on_every_keystroke = true,
-- 	snippet_placeholder = "..",
-- })

lsp.lua_ls.setup(config({
	root_dir = lsp.util.root_pattern({ 'init.vim', '.git' }),
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
					indent_style = 'tab',
					indent_size = '4',
				},
			},
		},
	},
}))

-- rust use rust-tools
--[[
lsp.rust_analyzer.setup(config({
    cmd = { "rustup", "run", "nightly", "rust-analyzer" },
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true,
            },
            checkOnSave = {
                command = "clippy",
            },
        },
    },
}))
--]]
-- c/c++
-- lsp.clangd.setup(config())
lsp.ccls.setup(config())

-- javascript/typescript
lsp.tsserver.setup(config())

-- astrojs
lsp.astro.setup(config())

-- tailwindcss language server
lsp.tailwindcss.setup(config())

-- go
lsp.gopls.setup(config({
	cmd = { "gopls", "serve" },
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
}))

-- python
lsp.jedi_language_server.setup(config())

-- css
lsp.cssls.setup(config({}))

-- tailwindcss
-- lsp.tailwindcss.setup(config({}))

-- latex
lsp.texlab.setup(config({
	cmd = { "texlab", "-v" },
	settings = {
		texlab = {
			build = {
				executeable = "latexmk",
				forwaredSearchAfter = false,
				onSave = true,
				args = {
					"-pdf",
					"-interaction=nonstopmode",
					"-output-directory=build",
					"-synctex=1",
					"--shell-escape",
					"%f",
				},
			},
			auxDirectory = "build",
			forwardSearch = {
				executable = "zathura",
				args = {
					"--synctex-forward",
					"%l:1:%f",
					"%p"
				},
			},
			chktex = {
				onOpenAndSave = false,
				onEdit = false,
			},
			diagnosticsDelay = 300,
			diagnostics = {
				allowedPatterns = {},
				ignoredPatterns = {},
			},
			formatterLineLength = 80,
			bibtexFormatter = "texlab",
			latexFormatter = "latexindent",
			latexindent = {
				--local = "~/.latexindent.yaml"
				modifyLineBreaks = true,
			},
		},
	},
}))

lsp.ltex.setup(config({}))

-- vhdl
-- lsp.ghdl_ls.setup(config({}))
if not configs.rust_hdl then
	configs.rust_hdl = {
		default_config = {
			cmd = { "vhdl_ls" },
			filetypes = { "vhdl" },
			root_dir = function(fname)
				return lsp.util.root_pattern('vhdl_ls.toml')(fname)
			end,
			settings = {},
		}
	}
end
lsp.rust_hdl.setup(config({}))

-- bash
lsp.bashls.setup(config({}))
