require('nvim-treesitter.configs').setup {
  -- A list of parser names, or "all"
  ensure_installed = { "ruby", "lua", "go" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,
}

vim.wo.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
