local lsp = require("Matthias.lsp")

lsp.lspconfig.sumneko_lua.setup(lsp.coq.lsp_ensure_capabilities({
    -- set the root file to the first parent directory containing the git repo
    -- or the file init.vim --> for the config
    root_dir = lsp.lspconfig.util.root_pattern({ 'init.vim', '.git' });
    on_attach = lsp.startCoq,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- path = vim.split(package.path, ';'),
                path = {
                    '?.lua',
                    '?/init.lua',
                },
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim', 'awesome' },
                neededFileStatus = {
                    ['codestyle-check'] = 'Any',
                },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
            format = {
                enable = true,
                defaultConfig = {
                    indent_style = 'space',
                    indent_size = '4',
                },
            },
        },
    },
}))
