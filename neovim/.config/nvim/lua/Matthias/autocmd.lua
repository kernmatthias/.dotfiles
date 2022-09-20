local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local fileGroup = augroup("fileGroup", {})
local yangGroup = augroup("HighlightYank", {})

-- breefly highlight the yanked section
autocmd("TextYankPost", {
    group = yangGroup,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 50,
        })
    end,
})

-- enable inlay hints for rust files (hopefully, maybe add them for all files)
autocmd({ "BufEnter", "BufWinEnter", "TabEnter" }, {
    group = fileGroup,
    pattern = "*.rs",
    callback = function()
        require("lsp_extensions").inlay_hints({})
    end,
})

-- ???
autocmd({ "BufWritePre" }, {
    group = fileGroup,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})

