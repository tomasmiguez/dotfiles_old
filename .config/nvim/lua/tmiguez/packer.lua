-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use { 
    'kyazdani42/nvim-tree.lua', 
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function() require('nvim-tree').setup() end
  }
  use {
    'nvim-telescope/telescope-fzf-native.nvim', 
    requires = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
    run = 'make' 
  }
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'qpkorr/vim-bufkill'
  use 'kassio/neoterm'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use { 'szw/vim-maximizer' }

  use { 
    'xiyaowong/nvim-transparent',
    config = function() require("transparent").setup({ enable = true }) end
  }
  use { 'kartikp10/noctis.nvim', requires = { 'rktjmp/lush.nvim' } }
  use { 'dracula/vim', as = 'dracula' }
end)
