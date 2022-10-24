local Remap = require("tmiguez.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap
local tnoremap = Remap.tnoremap

nnoremap('<c-q>', '<cmd>Ttoggle<CR>')
inoremap('<c-q>', '<Esc><cmd>Ttoggle<CR>')
tnoremap('<c-q>', '<c-\\><c-n><cmd>Ttoggle<CR>')

