-- Set up some high level options
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.fileencodings = 'utf-8'
vim.opt.spelllang = "en"

require('settings')
require('plugins')
require('lsp')
require('mappings')
require('theme')
