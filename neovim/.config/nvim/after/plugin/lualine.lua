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
			"encoding",
			"fileformat",
			"filetype",
		},
	},
})

