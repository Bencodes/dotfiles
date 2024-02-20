local M = {}

local settings = {
    Lua = {
        runtime = {
            version = "LuaJIT",
        },
        diagnostics = {
            globals = {
            },
        },
        disable = {
        },
    },
}

M.setup = function(on_attach, capabilities)
    local lspconfig = require "lspconfig"

    lspconfig.lua_ls.setup {
        on_attach = function(client, bufnr)
            client.server_capabilities.document_formatting = false
            client.server_capabilities.document_range_formatting = false
            on_attach(client, bufnr)
        end,
        settings = settings,
        flags = {
            debounce_text_changes = 150,
        },
        capabilities = capabilities,
    }
end

return M
