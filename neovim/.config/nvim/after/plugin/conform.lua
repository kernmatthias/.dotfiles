local remap = require("user.keymap")
local nnoremap = remap.nnoremap

local options = {
	formatters_by_ft = {
		-- css = { "prettier" },
		-- html = { "prettier" },
		json = { "fixjson" },
		lua = { "stylua" },
		python = { "ruff_organize_imports", "ruff_fix", "ruff_format" },
		-- rust = { "rustfmt", lsp_fallback = true },
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
	require("conform").format({ lsp_fallback = true })
end, { desc = "formatting" })
