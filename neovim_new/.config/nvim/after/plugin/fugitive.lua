vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local fugitiveGroup = augroup("fugitiveGroup", {})

autocmd("BufWinEnter", {
	group = fugitiveGroup,
	pattern = "*",
	callback = function()
		if vim.bo.ft ~= "fugitive" then
			return
		end

		local bufnr = vim.api.nvim_get_current_buf()
		local opts = {buffer = bufnr, remap = false}

		vim.keymap.set("n", "<leader>gP", function()
			vim.cmd.Git('push')
		end, opts)

		vim.keymap.set("n", "<leader>gp", function()
			vim.cmd.Git('pull')
		end, opts)

		vim.keymap.set("n", "<leader>gpr", function()
			vim.cmd.Git({'pull', '--rebase'})
		end, opts)
	end,
})

