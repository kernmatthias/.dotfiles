require("nvim-tree").setup({
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		width = 30,
	},
	renderer = {
		group_empty = true,
		hidden_display = "all",
	},
	filters = {
		git_ignored = true,
		dotfiles = false,
	},
})
