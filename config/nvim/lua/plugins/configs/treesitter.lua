local ok, treesitter = pcall(require, "nvim-treesitter.configs")

if not ok then
    return
end

treesitter.setup {
  -- A list of parser names, or "all"
    ensure_installed = { "lua", "kotlin", "python", "json", "yaml", "java", "bash", "jq", "starlark" },
		sync_install = false,
    autotag = {
        enable = true,
    },
    highlight = {
        enable = true,
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
  }
