-- load configs

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require('user.set')

require('user.plugins')

require('user.autocmd')
require('user.colors')
-- require('user.completions')
require('user.gitsigns')
require('user.keymap')
require('user.luasnip')
require('user.misc')
require('user.neogit')
require('user.telescope')
require('user.treesitter')

