return require('packer').startup(function(use)
    use('wbthomason/packer.nvim', { run = ':PackerSync' })

    -- faster startup
    use('lewis6991/impatient.nvim')

    -- neovim utils
    use('nvim-lua/plenary.nvim')
    use('nvim-lua/popup.nvim')

    -- language servers
    use('neovim/nvim-lspconfig')
    -- use('williamboman/nvim-lsp-installer')

    -- telescope -> finding + refactoring + ...
    use('nvim-telescope/telescope.nvim')
    use('nvim-telescope/telescope-fzf-native.nvim', { run = 'make' })

    -- treesitter -> semantic highlighting
    use('nvim-treesitter/nvim-treesitter-context')
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    -- completions
    -- use('hrsh7th/nvim-cmp')
    use('ms-jpq/coq_nvim')

    -- git client
    use('sindrets/diffview.nvim')
    use('TimUntersberger/neogit')

    -- undo tree
    use('mbbill/undotree')

    -- color schemes
    use('gruvbox-community/gruvbox')
    use('folke/tokyonight.nvim')
    use('navarasu/onedark.nvim')
end)

