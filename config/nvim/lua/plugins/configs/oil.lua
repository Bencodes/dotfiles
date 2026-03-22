local ok, oil = pcall(require, "oil")

if not ok then
	return
end

oil.setup({
	default_file_explorer = true,
	view_options = {
		show_hidden = false,
	},
})
