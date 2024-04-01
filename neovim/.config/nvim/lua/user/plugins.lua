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
	"simrat39/inlay-hints.nvim",

	-- telescope -> finding + refactoring + ...
	"nvim-telescope/telescope.nvim",
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },

	-- treesitter -> semantic highlighting
	"nvim-treesitter/nvim-treesitter-context",
	"nvim-treesitter/playground",
	{ "nvim-treesitter/nvim-treesitter",          run = ":TSUpdate" },

	-- completions
	"ms-jpq/coq_nvim",

	-- alternative completion engine
	--[[
	"hrsh7th/nvim-cmp",                       -- completion engine
	"hrsh7th/cmp-nvim-lsp",                   -- integration with lsp
	"hrsh7th/cmp-buffer",                     -- source the buffers for completion hints
	"hrsh7th/cmp-path",                       -- source the buffers for completion hints
	--]]

	"onsails/lspkind.nvim",                   -- configure completion popup
	{ "glepnir/lspsaga.nvim", branch = "main" }, -- more lsp actions (code actions, hover doc, ...)
	"simrat39/symbols-outline.nvim",          -- tree like view for symbols
	"L3MON4D3/LuaSnip",                       -- snippets, supports different formats

	--[[
	"saadparwaiz1/cmp_luasnip",               -- to have luasnip available as a source for the completions menu
	--]]

	-- git client
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
			-- Only one of these is needed, not both.
		},
		config = true
	},

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
	"simrat39/rust-tools.nvim",

	-- latex
	"lervag/vimtex",

	-- copilot
	--"github/copilot.vim",
})
