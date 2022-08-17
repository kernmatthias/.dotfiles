local telescope = require('telescope')
local previewers = require("telescope.previewers")
local actions = require("telescope.actions")

telescope.setup({
    defaults = {
        prompt_prefix = " >",
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

telescope.load_extension('fzf')

local M = {}

M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = " < Neovim Config Files >",
        cwd = vim.env.XDG_CONFIG_HOME,
        hidden = true,
    })
end

return M

