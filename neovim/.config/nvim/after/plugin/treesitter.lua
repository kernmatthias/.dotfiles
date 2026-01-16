require("nvim-treesitter.configs").setup({
	modules = {},
	ignore_install = {},
	auto_install = true,

	-- parsers to install
	ensure_installed = { "c", "cpp", "lua", "rust", "python", "go", "bash", "markdown" },
	sync_install = false,

	-- enable semantic highlighting
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})

vim.cmd(":TSInstall all")
vim.cmd(":TSUpdate")

require("nvim-treesitter-textobjects").setup({
	textobjects = {
		select = {
			enable = true,
			selection_modes = {
				["@parameter.outer"] = "v", -- charwise
				["@function.outer"] = "V", -- linewise
				-- ['@class.outer'] = '<c-v>', -- blockwise
			},
			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,
			include_surrounding_whitespace = false,
		},
	},
})

require("treesitter-context").setup()

vim.keymap.set({ "x", "o" }, "a=", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@assignment.outer", "textobjects")
end, { desc = "Select outer assignment" })
vim.keymap.set({ "x", "o" }, "i=", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@assignment.inner", "textobjects")
end, { desc = "Select inner assignment" })
vim.keymap.set({ "x", "o" }, "l=", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@assignment.lhs", "textobjects")
end, { desc = "Select lhs of assignment" })
vim.keymap.set({ "x", "o" }, "r=", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@assignment.rhs", "textobjects")
end, { desc = "Select rhs of assignment" })

vim.keymap.set({ "x", "o" }, "aa", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@parameter.outer", "textobjects")
end, { desc = "Select outer parameter" })
vim.keymap.set({ "x", "o" }, "ia", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@parameter.inner", "textobjects")
end, { desc = "Select inner parameter" })

vim.keymap.set({ "x", "o" }, "ai", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@condition.outer", "textobjects")
end, { desc = "Select outer part of condition" })
vim.keymap.set({ "x", "o" }, "ii", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@condition.inner", "textobjects")
end, { desc = "Select inner part of condition" })

vim.keymap.set({ "x", "o" }, "al", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@loop.outer", "textobjects")
end, { desc = "Select outer part of loop" })
vim.keymap.set({ "x", "o" }, "il", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@loop.inner", "textobjects")
end, { desc = "Select inner part of loop" })

vim.keymap.set({ "x", "o" }, "af", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@call.outer", "textobjects")
end, { desc = "Select outer part of function call" })
vim.keymap.set({ "x", "o" }, "if", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@call.inner", "textobjects")
end, { desc = "Select inner part of function call" })

vim.keymap.set({ "x", "o" }, "am", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
end, { desc = "Select outer part of method/function definition" })
vim.keymap.set({ "x", "o" }, "im", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
end, { desc = "Select inner part of method/function definition" })

vim.keymap.set({ "x", "o" }, "ac", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
end, { desc = "Select outer part of class definition" })
vim.keymap.set({ "x", "o" }, "ic", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
end, { desc = "Select inner part of class definition" })

vim.keymap.set({ "x", "o" }, "aC", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@comment.outer", "textobjects")
end, { desc = "Select outer part of comment" })
vim.keymap.set({ "x", "o" }, "iC", function()
	require("nvim-treesitter-textobjects.select").select_textobject("@comment.inner", "textobjects")
end, { desc = "Select inner part of comment" })
