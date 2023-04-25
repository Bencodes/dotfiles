-- local ok, copilot = pcall(require, "copilot")

-- if not ok then
--     return
-- end
vim.g.copilot_assume_mapped = true
vim.g.copilot_no_tab_map = false
vim.g.copilot_node_command = "/opt/homebrew/opt/node@16/bin/node"
--vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
