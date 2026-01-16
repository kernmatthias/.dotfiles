local remap = require("user.keymap")
local nnoremap = remap.nnoremap
local telescope = require("telescope")
local builtins = require("telescope.builtin")
local previewers = require("telescope.previewers")
local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"-L",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},

		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
				results_width = 0.8,
			},
			vertical = {
				mirror = false,
			},
			width = 0.87,
			height = 0.8,
			preview_cutoff = 120,
		},

		prompt_prefix = "> ",
		color_devicons = true,

		file_previewer = previewers.vim_buffer_cat.new,
		grep_previewer = previewers.vim_buffer_vimgrep.new,
		qflist_previewer_previewer = previewers.vim_buffer_qflist.new,

		mappings = {
			i = {
				["<C-x>"] = false,
				["<C-q>"] = actions.send_to_qflist,
			},
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("harpoon")

nnoremap("<C-p>", ":Telescope ", { desc = "Run telescope command" })
nnoremap("<leader>s", function()
	builtins.grep_string({ search = vim.fn.input("Grep for: ") })
end, { desc = "Grep for string" })
nnoremap("<leader>q", function()
	builtins.git_files()
end, { desc = "Telescope files in git repo" })
nnoremap("<leader>f", function()
	builtins.find_files()
end, { desc = "Telescope files" })
nnoremap("<leader>b", function()
	builtins.buffers()
end, { desc = "Telescope buffers" })
nnoremap("<leader>vh", function()
	builtins.help_tags()
end, { desc = "Telescope help" })
nnoremap("<leader>ls", function()
	builtins.lsp_document_symbols()
end, { desc = "Telescope lsp document symbols" })
nnoremap("<leader>lw", function()
	builtins.lsp_workspace_symbols()
end, { desc = "Telescope lsp workspace symbols" })
nnoremap("<leader>gi", function()
	builtins.lsp_implementations()
end, { desc = "Telescope lsp implementations" })
nnoremap("<leader>rr", function()
	builtins.lsp_references()
end, { desc = "Telescope lsp references" })
nnoremap("<leader>ld", function()
	builtins.diagnostics()
end, { desc = "Telescope lsp diagnostics" })
