-- line numbers
vim.opt.nu = true
vim.opt.rnu = true

vim.opt.hlsearch = false
vim.opt.hidden = true

-- indenting
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- no error bell
vim.opt.errorbells = false

-- place for displaying errors
vim.opt.signcolumn = "yes"

-- other configuration
vim.opt.wrap = false
vim.opt.updatetime = 50
vim.opt.colorcolumn = "100"
vim.opt.termguicolors = true
vim.opt.incsearch = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.cmdheight = 1

