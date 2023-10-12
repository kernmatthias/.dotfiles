
local silent = { silent = true }

vim.keymap.set("n", "<leader>m", function()
    require("harpoon.mark").add_file()
end, silent)
vim.keymap.set("n", "<leader>h", function()
    require("harpoon.ui").toggle_quick_menu()
end, silent)

-- easy switching within first 8 files
vim.keymap.set("n", "<leader>1", function()
    require("harpoon.ui").nav_file(1)
end, silent)
vim.keymap.set("n", "<leader>2", function()
    require("harpoon.ui").nav_file(2)
end, silent)
vim.keymap.set("n", "<leader>3", function()
    require("harpoon.ui").nav_file(3)
end, silent)
vim.keymap.set("n", "<leader>4", function()
    require("harpoon.ui").nav_file(4)
end, silent)
vim.keymap.set("n", "<leader>5", function()
    require("harpoon.ui").nav_file(5)
end, silent)
vim.keymap.set("n", "<leader>6", function()
    require("harpoon.ui").nav_file(6)
end, silent)
vim.keymap.set("n", "<leader>7", function()
    require("harpoon.ui").nav_file(7)
end, silent)
vim.keymap.set("n", "<leader>8", function()
    require("harpoon.ui").nav_file(8)
end, silent)
