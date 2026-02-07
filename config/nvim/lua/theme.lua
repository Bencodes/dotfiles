require("github-theme").setup({
	options = {
		styles = {
			functions = "italic",
		},
		darken = {
			sidebars = {
				enable = true,
				list = { "qf", "vista_kind", "terminal", "packer" },
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
			DiagnosticHint = { link = "LspDiagnosticsDefaultHint" },
			-- this will remove the highlight groups
			TSField = {},
		},
	},
})

vim.cmd("colorscheme github_dark")
