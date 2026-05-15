--[[
local cmp = require("cmp")
local ls = require("luasnip")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.abort()
			elseif ls.choice_active() then
				ls.change_choice(1)
			else
				fallback()
			end
		end),
		["<CR>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				if ls.expandable() then
					ls.expand()
				else
					cmp.confirm({
						select = true,
					})
				end
			else
				fallback()
			end
		end),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif ls.locally_jumpable(1) then
				ls.jump(1)
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif ls.locally_jumpable(-1) then
				ls.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "luasnip" },
	}, {
		{ name = "buffer", option = { get_bufnr = vim.api.nvim_list_bufs } },
		{
			name = "path",
			option = {
				get_cwd = function()
					-- TODO: add exceptions for langs that should not be realtive
					local buf_path = vim.api.nvim_buf_get_name(0)
					if buf_path ~= "" then
						return vim.fn.fnamemodify(buf_path, ":p:h")
					else
						return vim.fn.get_cwd()
					end
				end,
			},
		},
	}),
})

--[[
cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{
			name = "cmdline",
			option = {
				ignore_cmds = { "Man", "!" },
			},
		},
	}),
})
--]]
