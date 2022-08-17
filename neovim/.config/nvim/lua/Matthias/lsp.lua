local M = {}

M.lspconfig = require('lspconfig')

M.coq = require('coq')
function M.startCoq()
    vim.cmd('COQnow')
end

return M

