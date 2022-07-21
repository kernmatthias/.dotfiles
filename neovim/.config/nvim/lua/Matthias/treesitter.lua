require('nvim-treesitter.configs').setup({
    -- parsers to install
    ensure_installed = { 'c', 'cpp', 'lua', 'rust', 'python', 'go', 'fish' },
    sync_install = false,

    -- enable semantic highlighting
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
})

