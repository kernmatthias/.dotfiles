local ls = require('luasnip')
-- local types = require('luasnip.util.types')

ls.config.set_config({
	history = true,

	updateevents = "TextChanged,TextChangedI",

	-- enable autotriggered snippets
	enable_autosnippets = true,

	-- use tab to trigger visual selection
	store_selection_keys = "<Tab>",

	ext_opts = nil
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

local nnoremap = require('user.keymap').nnoremap

vim.keymap.set({ "i", "s" }, "<C-k>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-j>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { silent = true })

nnoremap("<leader><leader>s", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>")

-- lazy-load snippets
-- require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/snippets/" })

--[[
local ls = require('luasnip')
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.textnode
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep
--]]

-- local snippet = ls.s
local t = ls.text_node
local s = ls.snippet
local i = ls.insert_node

local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta

-- ls.add_snippets("all", {})

ls.add_snippets("tex", {
	s("ftt", {
		t("\\textt{"),
		i(1),
		t("}")
	}),
	s("bit", { fmt([[
begin{{itemize}}
\\item <>
\\end{{itemize}}
    ]],
		{
			i(1, "test")
		},
		{
			delimiters = "<>"
		}
	) })
})
