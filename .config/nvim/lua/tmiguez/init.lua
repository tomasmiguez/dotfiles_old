-- Packer setup with plugins
require("tmiguez.packer")

-- Lua cache
require('impatient')

-- Set options
require("tmiguez.set")

-- Plugins configuration
require("tmiguez.config")

-- Filetype detection
vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    { pattern = { "*.yajl" }, command = "setfiletype ruby" }
)

vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    { pattern = { "*.yajl" }, command = "LspStop<cr>" }
)
