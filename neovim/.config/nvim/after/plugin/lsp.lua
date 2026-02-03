-- local cmp = require('cmp')
local remap = require("user.keymap")
local mason = require("mason")

mason.setup()

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("fidget").setup({})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		remap.nnoremap("gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
		remap.nnoremap("gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
		-- remap.nnoremap("<leader>gi", vim.lsp.buf.implementation, { desc = "Goto Implementation" })
		remap.nnoremap("<leader>gd", vim.lsp.buf.type_definition, { desc = "Goto Type Definition" })
		remap.nnoremap("gh", function()
			vim.lsp.buf.hover({ border = "rounded" })
		end, { desc = "Display Hover Information" })
		remap.nnoremap("<leader>od", vim.diagnostic.open_float, { desc = "Open diagnostics as float" })
		remap.nnoremap("<leader>nd", function()
			vim.diagnostic.jump({ count = 1, float = true })
		end, { desc = "Jump to next diagnostic" })
		remap.nnoremap("<leader>pd", function()
			vim.diagnostic.jump({ count = -1, float = true })
		end, { desc = "Jump to previous diagnostic" })
		remap.nnoremap("<leader>ca", vim.lsp.buf.code_action, { desc = "Show available code actions" })
		-- remap.nnoremap("<leader>rr", vim.lsp.buf.references, { desc = "Show current symbol references" })
		remap.nnoremap("<leader>rn", function()
			require("renamer").rename()
		end, { desc = "Rename current symbol" })
		remap.nnoremap("<C-h>", vim.lsp.buf.signature_help, { desc = "Show signature help" })
	end,
})

vim.lsp.inlay_hint.enable(true)

vim.lsp.config("lua_ls", {
	capabilities = capabilities,
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
	capabilities = capabilities,
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
	capabilities = capabilities,
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
vim.lsp.config("ccls", {
	capabilities = capabilities,
	filetypes = { "cuda" },
})
vim.lsp.enable("ccls")

-- vim.lsp.enable("arduino_language_server")

-- javascript/typescript
vim.lsp.config("ts_ls", {
	capabilities = capabilities,
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
vim.lsp.config("astro", {
	capabilities = capabilities,
})
vim.lsp.enable("astro")

-- tailwindcss language server
vim.lsp.config("tailwindcss", {
	capabilities = capabilities,
})
vim.lsp.enable("tailwindcss")

-- go
vim.lsp.config("gopls", {
	capabilities = capabilities,
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
vim.lsp.config("basedpyright", {
	capabilities = capabilities,
})
vim.lsp.enable("basedpyright")
-- vim.lsp.config("ty", {
--  capabilities = capabilities,
-- 	settings = {
-- 		ty = {
-- 			inlayHints = {
-- 				variableTypes = true,
-- 			},
-- 		},
-- 	},
-- })
-- vim.lsp.enable("ty")

-- css
vim.lsp.config("cssls", {
	capabilities = capabilities,
})
vim.lsp.enable("cssls")

-- latex
vim.lsp.config("texlab", {
	capabilities = capabilities,
})
vim.lsp.enable("texlab")

vim.lsp.config("ltex_plus", {
	capabilities = capabilities,
})
vim.lsp.enable("ltex_plus")

-- vhdl
-- lsp.ghdl_ls.setup(config({}))
vim.lsp.config("vhdl_ls", {
	capabilities = capabilities,
})
vim.lsp.enable("vhdl_ls")

-- bash
vim.lsp.config("bashls", {
	capabilities = capabilities,
})
vim.lsp.enable("bashls")

-- ocaml
vim.lsp.config("ocamllsp", {
	capabilities = capabilities,
})
vim.lsp.enable("ocamllsp")

-- systemverilog
vim.lsp.config("verible", {
	capabilities = capabilities,
})
vim.lsp.enable("verible")

-- xml
vim.lsp.config("lemminx", {
	capabilities = capabilities,
})
vim.lsp.enable("lemminx")

-- zig
vim.lsp.config("zls", {
	capabilities = capabilities,
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
