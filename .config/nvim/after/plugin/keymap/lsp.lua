local Remap = require("tmiguez.keymap")
local nnoremap = Remap.nnoremap

nnoremap('<leader>la', vim.lsp.buf.code_action)
