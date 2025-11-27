local remap = require("user.keymap")
local nnoremap = remap.nnoremap

local options = {
	formatters_by_ft = {
		json = { "fixjson" },
		lua = { "stylua" },
		-- css = { "prettier" },
		-- html = { "prettier" },
		python = { "isort", "black" },
		vhdl = { "vsg" },
		zig = { "zigfmt" },
	},
	timeout_ms = 1000,

	-- format_on_save = {
	--   -- These options will be passed to conform.format()
	--   timeout_ms = 500,
	--   lsp_fallback = true,
	-- },
}

require("conform").setup(options)

-- nnoremap("<A-F>", "<cmd>:lua vim.lsp.buf.format()<CR>")
nnoremap("<A-F>", function()
	require("conform").format({ lsp_fallback = true, timeout_ms = 1000 })
end, { desc = "formatting" })
