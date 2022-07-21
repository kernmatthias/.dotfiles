local M = {}

function M.nnoremap(lhs, rhs)
    vim.keymap.set("n", lhs, rhs, { noremap = true })
end

function M.inoremap(lhs, rhs)
    vim.keymap.set("i", lhs, rhs, { noremap = true })
end

function M.vnoremap(lhs, rhs)
    vim.keymap.set("v", lhs, rhs, { noremap = true })
end

local nnoremap = M.nnoremap
local inoremap = M.inoremap
local vnoremap = M.vnoremap

-- line shifting in all modes
nnoremap("<A-j>", ":m .+1<CR>==")
nnoremap("<A-k>", ":m .-2<CR>==")
inoremap("<A-j>", "<Esc>:m .+1<CR>==gi")
inoremap("<A-k>", "<Esc>:m .-2<CR>==gi")
vnoremap("<A-j>", ":m '>+1<CR>gv=gv")
vnoremap("<A-k>", ":m '<-2<CR>gv=gv")

-- open directory with space d
nnoremap("<leader>d", ":Ex<CR>")

-- undotree
nnoremap("<leader>u", ":UndotreeToggle<CR>")

return M

