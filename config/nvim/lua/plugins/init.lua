-- Install packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Install the rest of the plugins
return require('packer').startup(function()
  -- Packer can manage itself
  use { 'wbthomason/packer.nvim' }
  -- Theme
  use { 'projekt0n/github-nvim-theme' }
	use { 'shaunsingh/solarized.nvim' }
	use { 'shaunsingh/moonlight.nvim' }
	use { 'shaunsingh/nord.nvim' }
  use {
    'kyazdani42/nvim-web-devicons',
    config = require "plugins.configs.icons",
  }
  -- LSPs
  use { 'neovim/nvim-lspconfig' }
  use { 'williamboman/nvim-lsp-installer' }
  -- Fuzzy finding
  use { 'jremmen/vim-ripgrep' }
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = require "plugins.configs.telescope",
  }
  -- File browser
  use {
    'preservim/nerdtree',
    config = require "plugins.configs.nerdtree",
}
  -- Formatting
  use {
    'sbdchd/neoformat',
    config = require "plugins.configs.neoformat",
  }
  -- Code completion and syntax heilighting
  use { 
    'github/copilot.vim',
    config = require "plugins.configs.copilot",
  }
	use { 'udalov/kotlin-vim' }
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
    config = require "plugins.configs.treesitter",
	}
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  -- use 'nvim-treesitter/playground'
  use {
    'hrsh7th/nvim-cmp',
    requires = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-nvim-lsp-document-symbol',
        'hrsh7th/cmp-vsnip',
        'hrsh7th/vim-vsnip',
        'hrsh7th/cmp-nvim-lsp-signature-help',
    },
    config = require 'plugins.configs.cmp',
}
  -- Git
  use { 'airblade/vim-gitgutter' }
  -- Navigation
  use { 'christoomey/vim-tmux-navigator' }
end)

