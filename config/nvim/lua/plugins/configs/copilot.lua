local ok, copilot = pcall(require, "copilot")

if not ok then
	return
end

copilot.setup({
	panel = {
		enabled = false,
	},
	suggestion = {
		enabled = false,
	},
	filetypes = {
		help = true,
		markdown = true,
	},
})

local cmp_ok, copilot_cmp = pcall(require, "copilot_cmp")

if not cmp_ok then
	return
end

copilot_cmp.setup()
