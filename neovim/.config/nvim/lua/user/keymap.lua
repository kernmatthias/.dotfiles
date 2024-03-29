local M = {}

local function bind(op, outer_opts)
	outer_opts = outer_opts or { noremap = true }
	return function(lhs, rhs, opts)
		opts = vim.tbl_extend("force",
			outer_opts,
			opts or {}
		)
		vim.keymap.set(op, lhs, rhs, opts)
	end
end

M.nmap = bind("n", { noremap = false })
M.imap = bind("i", { noremap = false })
M.vmap = bind("v", { noremap = false })
M.nnoremap = bind("n")
M.inoremap = bind('i')
M.vnoremap = bind('v')
M.xnoremap = bind('x')

return M
