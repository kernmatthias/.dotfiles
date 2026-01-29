return require("lazy").setup({
	-- faster startup
	-- "lewis6991/impatient.nvim",

	-- neovim utils
	"nvim-lua/plenary.nvim",
	"nvim-lua/popup.nvim",
	"nvim-lua/lsp_extensions.nvim",

	-- language servers
	"neovim/nvim-lspconfig",
	"j-hui/fidget.nvim",
	"williamboman/mason.nvim",
	"filipdutescu/renamer.nvim",

	-- telescope -> finding + refactoring + ...
	"nvim-telescope/telescope.nvim",
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},

	-- treesitter -> semantic highlighting
	{ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
	{ "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" },
	"nvim-treesitter/nvim-treesitter-context",
	"nvim-treesitter/playground",

	-- completions
	"hrsh7th/nvim-cmp", -- completion engine
	"hrsh7th/cmp-nvim-lsp", -- integration with lsp
	"hrsh7th/cmp-nvim-lsp-signature-help", -- insert function template
	"hrsh7th/cmp-buffer", -- source the buffers for completion hints
	"hrsh7th/cmp-path", -- source the buffers for completion hints
	"hrsh7th/cmp-cmdline", -- to have cmp work in command mode and search

	-- "saghen/blink.cmp"

	-- "onsails/lspkind.nvim", -- configure completion popup
	-- { "glepnir/lspsaga.nvim", branch = "main" }, -- more lsp actions (code actions, hover doc, ...)

	"hedyhli/outline.nvim", -- tree like view for symbols

	{
		"L3MON4D3/LuaSnip", -- snippets, supports different formats
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	"saadparwaiz1/cmp_luasnip", -- to have luasnip available as a source for the completions menu

	-- git client
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
			"nvim-tree/nvim-web-devicons",
			-- Only one of these is needed, not both.
		},
		config = true,
	},

	-- git integration
	"lewis6991/gitsigns.nvim",

	-- undo tree
	"mbbill/undotree",

	-- color schemes
	"gruvbox-community/gruvbox",
	"folke/tokyonight.nvim",
	"catppuccin/nvim",

	--[[
	-- debugging
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use("theHamsta/nvim-dap-virtual-text")
	--]]

	-- tools
	"ThePrimeagen/harpoon", -- for marking files to revisit them later
	"kylechui/nvim-surround", -- for having surround command
	"mzlogin/vim-markdown-toc",

	-- rust
	-- "simrat39/rust-tools.nvim",

	-- latex
	{
		"lervag/vimtex",
		lazy = false,
		init = function()
			vim.g.vimtex_view_method = "zathura"
			vim.g.vimtex_compiler_latexmk = {
				out_dir = function()
					return "build"
				end,
				aux_dir = function()
					return "build"
				end,
			}
		end,
	},

	-- keybinds
	"folke/which-key.nvim",

	-- autoformatting
	"stevearc/conform.nvim",

	-- file browser
	"nvim-tree/nvim-tree.lua",

	-- for future use
	-- {"folke/noice.nvim", event="VeryLazy", dependencies={"MunifTanjim/nui.nvim"}}
})
