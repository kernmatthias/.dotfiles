-- vim.cmd.packadd("packer.nvim")

return require("packer").startup(function(use)
	--
	use("wbthomason/packer.nvim", { run = ":PackerSync" })

	-- neovim utils
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")
	use("nvim-lua/lsp_extensions.nvim")

	use("nvim-telescope/telescope.nvim")

	-- color schemes
	use({
		"catppuccin/nvim",
		config = function()
			require("catppuccin").setup({ style = "mocca", transparent_background = false })
			vim.cmd("colorscheme catppuccin")
		end,
	})

	use({
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use("nvim-treesitter/playground")
	use("theprimeagen/harpoon")
	use("mbbill/undotree")
	use("tpope/vim-fugitive")
	use("nvim-treesitter/nvim-treesitter-context")
	use({
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({})
		end,
	})

	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },

			-- autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },

			{ "L3MON4D3/LuaSnip" },
			{ "saadparwaiz1/cmp_luasnip" },
		},
	})
	use("j-hui/fidget.nvim")

	use("github/copilot.vim")
	use({
		"tzachar/cmp-tabnine",
		run = "./install.sh"
	}) -- tabnine
	use("mzlogin/vim-markdown-toc")
end)

