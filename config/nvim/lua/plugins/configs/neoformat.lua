local g = vim.g
g.neoformat_run_all_formatters = 1

-- Python formatters
g.neoformat_enabled_python = {"black", "isort"}
g.neoformat_enabled_yaml = {"prettier"}
g.neoformat_enabled_markdown = {"prettier"}
g.neoformat_enabled_lua = {"luaformatter"}