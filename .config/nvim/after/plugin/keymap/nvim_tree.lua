local Remap = require("tmiguez.keymap")
local nnoremap = Remap.nnoremap

nnoremap("<leader>tt", ":NvimTreeToggle<CR>")
nnoremap("<leader>tF", ":NvimTreeFocus<CR>")
nnoremap("<leader>tf", ":NvimTreeFindFile<CR>")
nnoremap("<leader>tc", ":NvimTreeCollapse<CR>")

