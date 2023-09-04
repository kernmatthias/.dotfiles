require('nvim-treesitter.configs').setup({
	modules = {},
	ignore_install = {},
	auto_install = true,

	-- parsers to install
	ensure_installed = { 'c', 'cpp', 'lua', 'rust', 'python', 'go', 'bash', 'markdown' },
	sync_install = false,

	-- enable semantic highlighting
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})
