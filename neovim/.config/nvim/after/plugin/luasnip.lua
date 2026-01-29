local ls = require("luasnip")
-- local types = require('luasnip.util.types')

ls.config.set_config({
	history = true,

	updateevents = "TextChanged,TextChangedI",

	-- enable autotriggered snippets
	enable_autosnippets = true,

	-- use tab to trigger visual selection
	store_selection_keys = "<Tab>",

	ext_opts = nil,
	--[[
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { "<-", "Error" } },
            },
        },
    },
    --]]
})

vim.keymap.set({ "i", "s" }, "<C-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { silent = true })

-- lazy-load snippets
require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/snippets/" })
require("luasnip.loaders.from_vscode").lazy_load({ exclude = vim.g.vscode_snippets_exclude or {} })
require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.g.vscode_snippets_path or "" })
