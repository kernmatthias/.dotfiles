require("nvim-tree").setup({
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		width = 30,
	},
	modified = {
		enable = true,
		show_on_dirs = true,
		show_on_open_dirs = false,
	},
	renderer = {
		group_empty = true,
		hidden_display = "all",
		highlight_modified = "name",
		icons = {
			glyphs = {
				modified = "󰏫",
				folder = {
					arrow_closed = "󰅂",
					arrow_open = "󰅀",
					default = "󰉋",
					open = "󰝰",
				},
				git = {
					unstaged = "󰄱",
					staged = "󰱒",
					unmerged = "󰹹",
					renamed = "󰁔",
					untracked = "󰇘",
					deleted = "󰛉",
					ignored = "󰛐",
				},
			},
		},
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		show_on_open_dirs = false,
	},
	filters = {
		git_ignored = false,
		dotfiles = false,
	},
	prefer_startup_root = true,
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = true,
	},
})

vim.api.nvim_create_autocmd("QuitPre", {
	callback = function()
		local tree_wins = {}
		local floating_wins = {}
		local wins = vim.api.nvim_list_wins()
		for _, w in ipairs(wins) do
			local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
			if bufname:match("NvimTree_") ~= nil then
				table.insert(tree_wins, w)
			end
			if vim.api.nvim_win_get_config(w).relative ~= "" then
				table.insert(floating_wins, w)
			end
		end
		if 1 == #wins - #floating_wins - #tree_wins then
			-- Should quit, so we close all invalid windows.
			for _, w in ipairs(tree_wins) do
				vim.api.nvim_win_close(w, true)
			end
		end
	end,
})

require("lsp-file-operations").setup()
