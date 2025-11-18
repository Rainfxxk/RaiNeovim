vim.lsp.enable("lua_ls")
vim.lsp.enable("clangd")
-- vim.lsp.enable("svls")

vim.lsp.inlay_hint.enable(true)

vim.diagnostic.config {
    virtual_text = {
        spacing = 4,
        prefix = '●'
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '●',
            [vim.diagnostic.severity.WARN] = '●',
            [vim.diagnostic.severity.INFO] = '●',
            [vim.diagnostic.severity.HINT] = '●',
        }
    }

}
