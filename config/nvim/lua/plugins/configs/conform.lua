local ok, conform = pcall(require, "conform")

if not ok then
	return
end

conform.setup({
	default_format_opts = {
		lsp_format = "fallback",
	},
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "ruff_format" },
		yaml = { "prettier" },
		markdown = { "prettier" },
		bzl = { "buildifier" },
		starlark = { "buildifier" },
	},
})
