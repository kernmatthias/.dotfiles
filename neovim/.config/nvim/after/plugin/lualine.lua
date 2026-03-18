require("lualine").setup({
	sections = {
		lualine_x = {
			{
				function()
					local ls = require("luasnip")
					if ls.choice_active() then
						return "󰻧 Choice" -- Icon for choice nodes
					elseif ls.in_snippet() then
						return " Snippet" -- Icon for being inside a snippet
					end
					return ""
				end,
			},
			{
				function()
					local msg = "No Active Lsp"
					local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
					local clients = vim.lsp.get_clients()
					if next(clients) == nil then
						return msg
					end
					for _, client in ipairs(clients) do
						local filetypes = client.config.filetypes
						if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
							return client.name
						end
					end
					return msg
				end,
				icon = " LSP:",
				color = { fg = "#ffffff", gui = "bold" },
			},
			"encoding",
			"fileformat",
			"filetype",
		},
	},
})

