return require("packer").startup(function(use)
    use("wbthomason/packer.nvim", { run = ":PackerSync" }) -- package manager

    -- faster startup
    use("lewis6991/impatient.nvim")

    -- neovim utils
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")
    use("nvim-lua/lsp_extensions.nvim")

    -- language servers
    use("neovim/nvim-lspconfig")
    -- use("williamboman/nvim-lsp-installer") -- for installing inside neovim

    -- telescope -> finding + refactoring + ...
    use("nvim-telescope/telescope.nvim")
    use("nvim-telescope/telescope-fzf-native.nvim", { run = "make" })

    -- treesitter -> semantic highlighting
    use("nvim-treesitter/nvim-treesitter-context")
    use("nvim-treesitter/playground")
    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

    -- completions
    use("hrsh7th/nvim-cmp") -- completion engine
    use("hrsh7th/cmp-nvim-lsp") -- integration with lsp
    use("hrsh7th/cmp-buffer") -- source the buffers for completion hints
    use("onsails/lspkind.nvim") -- configure completion popup
    use("glepnir/lspsaga.nvim", { branch = "main" }) -- more lsp actions (code actions, hover doc, ...)
    use("simrat39/symbols-outline.nvim") -- tree like view for symbols
    use("L3MON4D3/LuaSnip") -- snippets, supports different formats
    use("saadparwaiz1/cmp_luasnip") -- to have luasnip available as a source for the completions menu
    use("tzachar/cmp-tabnine", { run = "./install.sh" }) -- tabnine

    -- alternative completion engine
    -- use("ms-jpq/coq_nvim")

    -- git client
    use("sindrets/diffview.nvim")
    use("TimUntersberger/neogit")

    -- undo tree
    use("mbbill/undotree")

    -- color schemes
    use("gruvbox-community/gruvbox")
    use("folke/tokyonight.nvim")
    use("navarasu/onedark.nvim")
    use("catppuccin/nvim")

    -- debugging
    use("mfussenegger/nvim-dap")
    use("rcarriga/nvim-dap-ui")
    use("theHamsta/nvim-dap-virtual-text")

    -- tools
    use("ThePrimeagen/harpoon") -- for marking files to revisit them later
    use("kylechui/nvim-surround") -- for having surround command
end)

