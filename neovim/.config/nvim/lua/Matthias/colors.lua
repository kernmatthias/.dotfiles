-- color column color
local ccc = {
    --["gruvbox"] = "#555555",
    ["tokyonight"] = "#5caed3",
    ["onedark"] = "none",
    ["catppuccin"] = "none",
}

function ApplyColors(colorscheme)
    -- gruvbox colors
    vim.g.gruvbox_contrast_dark = 'hard'
    vim.g.gruvbox_invert_selection = '0'

    -- vim.opt.background = "dark"

    vim.cmd("colorscheme " .. colorscheme)

    local hl = function(item, options)
        vim.api.nvim_set_hl(0, item, options)
    end

    hl("SignColumn", {
        bg = "none",
    })

    -- set
    hl("ColorColumn", {
        ctermbg = 0,
        bg = ccc[colorscheme],
    })

    -- show line numbers in baby blue when having tokyonight as colorscheme
    if vim.g.colorscheme == "tokyonight" then
        hl("LineNr", {
            fg = "#5eacd3",
        })
    end

    --[[
    hl("Normal", {
        bg = "none",
    })

    hl("CursorLineNR", {
        bg = "none",
    })

    hl("netrwDir", {
        fg = "#6aecd3",
    })
    --]]
end

-- set style of onedark
--[[
require('onedark').setup({
    style = 'darker'
})
--]]

require('catppuccin').setup({
    style = 'mocca',
    transparent_background = false,
})

ApplyColors('catppuccin')

