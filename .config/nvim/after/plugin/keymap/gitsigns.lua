local Remap = require("tmiguez.keymap")
local nnoremap = Remap.nnoremap

nnoremap('<leader>gb', '<cmd>Gitsigns toggle_current_line_blame<CR>')
