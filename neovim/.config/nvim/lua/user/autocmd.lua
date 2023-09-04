local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local fileGroup = augroup("fileGroup", {})
local yangGroup = augroup("HighlightYank", {})

-- breefly highlight the yanked section
autocmd("TextYankPost", {
	group = yangGroup,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 50,
		})
	end,
})

-- ???
autocmd({ "BufWritePre" }, {
	group = fileGroup,
	pattern = "*",
	command = "%s/\\s\\+$//e",
})
