require('config.set')
require('config.remap')
require('config.packer')
require('config.completions')

function R(name)
	require('plenary.reload').reload_module(name)
end

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local fileGroup = augroup("fileGroup", {})
local yankGroup = augroup("HighlightYank", {})

-- breefly highlight the yanked section
autocmd("TextYankPost", {
	group = yankGroup,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 50,
		})
	end,
})

autocmd({"BufWritePre"}, {
	group   = fileGroup,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

