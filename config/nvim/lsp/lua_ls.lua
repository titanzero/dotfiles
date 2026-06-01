-- LUA LSP
return {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { ".luarc.json", ".git" },
    settings = {
        Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
                checkThirdParty = false,
                libraty = {
                    vim.env.VIMRUNTIME,
                },
            },
            telemetry = { enable = false },
        },
    },
}
