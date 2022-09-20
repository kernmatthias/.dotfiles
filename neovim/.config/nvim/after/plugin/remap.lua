local remap = require('Matthias.keymap')
local nnoremap = remap.nnoremap
local vnoremap = remap.vnoremap
-- local inoremap = remap.inoremap
local xnoremap = remap.xnoremap

-- line shifting in all modes
-- nnoremap("<A-j>", ":m .+1<CR>==")
-- nnoremap("<A-k>", ":m .-2<CR>==")
-- inoremap("<A-j>", "<Esc>:m .+1<CR>==gi")
-- inoremap("<A-k>", "<Esc>:m .-2<CR>==gi")
-- vnoremap("<A-j>", ":m '>+1<CR>gv=gv")
-- vnoremap("<A-k>", ":m '<-2<CR>gv=gv")
nnoremap("<C-j>", ":m .+1<CR>==")
nnoremap("<C-k>", ":m .-2<CR>==")
vnoremap("<C-j>", ":m '>+1<CR>gv=gv")
vnoremap("<C-k>", ":m '<-2<CR>gv=gv")

-- open directory with space d
nnoremap("<leader>d", ":Ex<CR>")

-- undotree
nnoremap("<leader>u", ":UndotreeToggle<CR>")

-- allow replacing selection with regular buffer and keeping the content
xnoremap("<leader>p", "\"_dP")

