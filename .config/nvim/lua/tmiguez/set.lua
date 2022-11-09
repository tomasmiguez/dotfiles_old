vim.opt.completeopt = 'menu,menuone,noselect' -- better autocomplete options

vim.opt.splitright = true -- splits to the right
vim.opt.splitbelow = true -- splits below

vim.opt.number = true -- Show current line absolute number
vim.opt.relativenumber = true -- show relative line numbers

vim.opt.ignorecase = true -- search case insensitive
vim.opt.smartcase = true -- search via smartcase
vim.opt.incsearch = true -- search incremental

-- vim.opt.diffopt+=vertical -- starts diff mode in vertical split

vim.opt.hidden = true -- allow hidden buffers

vim.opt.backup = false -- don't create backup files
vim.opt.swapfile = false -- don't create swapfiles
vim.opt.undodir = '/home/tomiguez/.nvim/undodir' -- set undodir path. REMEMBER TO CREATE IT
vim.opt.undofile = true -- persists undo tree

-- vim.opt.laststatus = 3 -- Always show statusline
vim.opt.cmdheight = 1 -- only one line for commands

vim.opt.shortmess = vim.opt.shortmess + 'c' -- don't need to press enter so often

vim.opt.signcolumn = 'yes' -- add a column for sings (e.g. LSP, ...)

vim.opt.updatetime = 520 -- time until update

vim.opt.mouse = '' -- Disable mouse

vim.opt.clipboard = 'unnamedplus' -- use system clipboard

vim.opt.title = true -- Show folder on bar
-- let &titlestring = '%{%substitute(getcwd(), "^" . expand("$HOME") . "/repos/\\(.\\{-}\\)/.*", "\\=submatch(1)", "")%}'

if string.find(vim.fn.getcwd(), vim.fn.expand("$HOME") .. '/repos/') then
  local removed_repos = string.gsub(vim.fn.getcwd(), vim.fn.expand("$HOME") .. '/repos/', '')
  local only_folder = string.gsub(removed_repos, "/([^/]+)/.+", '%1')
  vim.opt.titlestring = only_folder .. " %m"
else
  vim.opt.titlestring = vim.fn.getcwd() .. " %m"
end

vim.opt.hlsearch = true -- search highlighting

-- vim.opt.wrap = false -- no text wrap

vim.opt.termguicolors = true -- better colors, but makes it very slow!

vim.g.mapleader = ' '

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevel = 99

-- Should be overwritten on ftplugins

vim.opt.expandtab = true -- space characters instead of tab
vim.opt.tabstop = 2 -- tab equals 2 spaces
vim.opt.shiftwidth = 2 -- indentation

vim.opt.colorcolumn = '120' -- Color column of max line length
