local Remap = require("tmiguez.keymap")
local nnoremap = Remap.nnoremap

nnoremap("<leader>tt", "<cmd>NvimTreeToggle<CR>")
nnoremap("<leader>tF", "<cmd>NvimTreeFocus<CR>")
nnoremap("<leader>tf", "<cmd>NvimTreeFindFile<CR>")
nnoremap("<leader>tc", "<cmd>NvimTreeCollapse<CR>")

