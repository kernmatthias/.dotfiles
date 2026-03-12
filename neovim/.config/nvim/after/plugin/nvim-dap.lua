local dap = require("dap")

vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { noremap = true, desc = "DAP: toggle_breakpoint" })
vim.keymap.set("n", "<leader>dc", dap.continue, { noremap = true, desc = "DAP: continue" })
vim.keymap.set("n", "<leader>do", dap.step_over, { noremap = true, desc = "DAP: step over" })
vim.keymap.set("n", "<leader>di", dap.step_into, { noremap = true, desc = "DAP: step into" })

vim.keymap.set("n", "<leader>dl", function()
	require("osv").launch({ port = 8086 })
end, { noremap = true, desc = "DAP: launch osv debug server" })

vim.keymap.set("n", "<leader>dw", function()
	local widgets = require("dap.ui.widgets")
	widgets.hover()
end, { noremap = true, desc = "DAP: widgets?" })

vim.keymap.set("n", "<leader>df", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.frames)
end, { noremap = true, desc = "DAP: center current fload" })

