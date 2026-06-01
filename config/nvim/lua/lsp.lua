vim.lsp.enable({
    "lua_ls",
})

vim.diagnostic.config({
    severity_sort = true,
    update_in_insert = true,
    float = {
        border = vim.opt.winborder,
        source = "if_many",
    },
    virtual_text = {
        spacing = 2,
        prefix = "●"
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "E",
            [vim.diagnostic.severity.WARN]  = "W",
            [vim.diagnostic.severity.INFO]  = "I",
            [vim.diagnostic.severity.HINT]  = "H",
        },
    },
})
