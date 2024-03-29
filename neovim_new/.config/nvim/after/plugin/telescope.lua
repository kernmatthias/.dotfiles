vim.keymap.set("n", "<C-p>", ":Telescope")
vim.keymap.set("n", "<leader>ps", function()
    require("telescope.builtin").grep_string({ search = vim.fn.input("Grep For > ") })
end)
vim.keymap.set("n", "<C-p>", function()
    require("telescope.builtin").git_files()
end)
vim.keymap.set("n", "<leader>pf", function()
    require("telescope.builtin").find_files()
end)
vim.keymap.set("n", "<leader>pb", function()
    require("telescope.builtin").buffers()
end)
vim.keymap.set("n", "<leader>vh", function()
    require("telescope.builtin").help_tags()
end)

