return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		dependencies = {
			"zbirenbaum/copilot-cmp",
		},
		config = function()
			require("plugins.configs.copilot")
		end,
	},
}
