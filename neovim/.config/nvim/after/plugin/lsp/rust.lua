local lsp = require("Matthias.lsp")

lsp.lspconfig.rust_analyzer.setup(lsp.coq.lsp_ensure_capabilities({
    on_attach = lsp.startCoq,
    settings = {
        ['rust-analyzer'] = {
            importGranularity = 'module',
            assist = {
                importPrefix = 'self',
            },
            cargo = {
                loadOutDirsFromCheck = true,
            },
            procMacro = {
                enable = true,
            },
        },
    },
}))

