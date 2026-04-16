local ok, github_theme = pcall(require, "github-theme")

if not ok then
	return
end

github_theme.setup({
	options = {
		styles = {
			functions = "italic",
		},
		darken = {
			sidebars = {
				enable = true,
				list = { "qf", "terminal", "lazy" },
			},
		},
	},

	-- Change the "hint" color to the "orange" color, and make the "error" color bright red
	specs = {
		github_dark = {
			diag = {
				hint = "orange",
				error = "#ff0000",
			},
		},
	},

	-- Overwrite the highlight groups
	groups = {
		all = {
			htmlTag = { fg = "palette.red", bg = "#282c34", sp = "diag.hint", style = "underline" },
		},
	},
})

pcall(vim.cmd.colorscheme, "github_dark")
