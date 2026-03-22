local ok, treesitter = pcall(require, "nvim-treesitter.configs")

if not ok then
	return
end

treesitter.setup({
	-- A list of parser names, or "all"
	ensure_installed = {
		"lua",
		"kotlin",
		"python",
		"json",
		"yaml",
		"java",
		"bash",
		"jq",
		"starlark",
		"markdown",
		"markdown_inline",
	},
	sync_install = false,
	highlight = {
		enable = true,
	},
})
