-- local cmp = require('cmp')
local coq = require("coq")
local remap = require("user.keymap")
local mason = require("mason")

mason.setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("fidget").setup({})

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

vim.lsp.inlay_hint.enable(true)

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
			hint = {
				enable = true,
			},
		},
	},
})
vim.lsp.enable("lua_ls")

-- rust
vim.lsp.config("rust_analyzer", {
	settings = {
		["rust-analyzer"] = {
			inlayHints = {
				bindingModeHints = {
					enable = false,
				},
				chainingHints = {
					enable = true,
				},
				closingBraceHints = {
					enable = true,
					minLines = 25,
				},
				closureCaptureHints = {
					enable = true,
				},
				closureReturnTypeHints = {
					enable = "never",
				},
				closureStyle = "impl_fn",
				discriminantHints = {
					enable = "never",
				},
				expressionAdjustmentHints = {
					disableReborrows = true,
					enable = "never",
					hideOutsideUnsafe = false,
					mode = "prefix",
				},
				genericParameterHints = {
					const = {
						enable = true,
					},
					lifetime = {
						enable = true,
					},
					type = {
						enable = true,
					},
				},
				implicitDrops = {
					enable = true,
				},
				implicitSizedBoundHints = {
					enable = true,
				},
				impliedTynTraitHints = {
					enable = true,
				},
				lifetimeElisionHints = {
					enable = "never",
					useParameterNames = false,
				},
				maxLength = 25,
				parameterHints = {
					enable = true,
				},
				rangeExclusiveHints = {
					enable = true,
				},
				--[[ deprecated
				reborrowHints = {
					enable = "never",
				},
                --]]
				renderColons = true,
				typeHints = {
					enable = true,
					hideClosureInitialization = false,
					hideClosureParameter = false,
					hideNamedConstructor = false,
				},
			},
			diagnostics = {
				enable = false,
			},
		},
	},
})
vim.lsp.enable("rust_analyzer")

-- c/c++
-- remove cuda support from clangd
vim.lsp.config("clangd", {
	filetypes = { "c", "cpp", "objc", "objcpp", "proto", "arduino" },
	settings = {
		clangd = {
			InlayHints = {
				Designators = true,
				Enabled = true,
				ParameterNames = true,
				DeducedTypes = true,
			},
		},
	},
})
vim.lsp.enable("clangd")

-- only use ccls for cuda
vim.lsp.config("ccls", { filetypes = { "cuda" } })
vim.lsp.enable("ccls")

-- vim.lsp.enable("arduino_language_server")

-- javascript/typescript
vim.lsp.config("ts_ls", {
	settings = {
		typescript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayVariableTypeHintsWhenTypeMatchesName = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
		},
		javascript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayVariableTypeHintsWhenTypeMatchesName = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
		},
	},
})
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
			hints = {
				rangeVariableTypes = true,
				parameterNames = true,
				constantValues = true,
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				functionTypeParameters = true,
			},
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
})
vim.lsp.enable("gopls")

-- python
-- vim.lsp.enable("basedpyright")
vim.lsp.config("ty", {
	settings = {
		ty = {
			inlayHints = {
				variableTypes = true,
			},
		},
	},
})
vim.lsp.enable("ty")

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

-- zig
vim.lsp.config("zls", {
	settings = {
		zls = {
			enable_inlay_hints = true,
			inlay_hints_show_builtin = true,
			inlay_hints_exclude_single_argument = true,
			inlay_hints_hide_redundant_param_names = false,
			inlay_hints_hide_redundant_param_names_last_token = false,
		},
	},
})
vim.lsp.enable("zls")
