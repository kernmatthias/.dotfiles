local lsp = require("Matthias.lsp")

lsp.lspconfig.clangd.setup(lsp.coq.lsp_ensure_capabilities({
    on_attach = lsp.startCoq,
}))

