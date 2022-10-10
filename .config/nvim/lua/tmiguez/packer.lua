-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Functionality
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
  use 'tpope/vim-fugitive'
  use 'qpkorr/vim-bufkill'
  use 'kassio/neoterm'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use { 'szw/vim-maximizer' }
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }
  use {
    'lewis6991/gitsigns.nvim',
    config = function() require('gitsigns').setup({}) end
  }
  use 'ggandor/lightspeed.nvim'
  use 'wakatime/vim-wakatime'
  use {
    "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
  }

  -- Appearance
  use {
    'hoob3rt/lualine.nvim',
    config = function() require('lualine').setup({ options = { theme = "dracula" } }) end
  }
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function() require("indent_blankline").setup({ show_trailing_blankline_indent = false }) end
  }
  -- Packer
  use {
    "folke/noice.nvim",
    requires = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    config = function() require("noice").setup() end,
    event = "VimEnter"
  }
  use {
    'xiyaowong/nvim-transparent',
    config = function() require("transparent").setup({ enable = true }) end
  }
  use { 'kartikp10/noctis.nvim', requires = { 'rktjmp/lush.nvim' } }
  use { 'dracula/vim', as = 'dracula' }
  use { 'catppuccin/nvim', as = 'catppuccin' }
  use 'folke/tokyonight.nvim'
  use 'tiagovla/tokyodark.nvim'
end)
