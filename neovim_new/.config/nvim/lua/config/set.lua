vim.opt.guicursor = ""

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- prevent highlighted stuff from staying highlighted
vim.opt.hlsearch = false
vim.opt.hidden = true

-- indenting
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.smartindent = true

-- no error bell
vim.opt.errorbells = false

-- vim.opt.signcolumn = "yes"

-- other configuration
vim.opt.wrap = false
vim.opt.updatetime = 50
vim.opt.colorcolumn = "100"
vim.opt.termguicolors = true
vim.opt.incsearch = true
vim.opt.undodir = os.getenv("HOME") .. "/.cache/nvim/undodir"
vim.opt.undofile = true

-- place for displaying errors
vim.opt.cmdheight = 1

-- netrw
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- vim markdown toc
vim.g.vmt_list_item_char = '-'

vim.opt.scrolloff = 8

vim.opt.isfname:append("@-@")

