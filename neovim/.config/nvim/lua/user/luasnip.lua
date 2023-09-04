local ls = require('luasnip')
-- local types = require('luasnip.util.types')

ls.config.set_config({
    history = true,

    updateevents = "TextChanged,TextChangedI",

    -- enable autotriggered snippets
    enable_autosnippets = true,

    -- use tab to trigger visual selection
    store_selection_keys = "<Tab>",

    ext_opts = nil
    --[[
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { "<-", "Error" } },
            },
        },
    },
    --]]
})

