local Remap = require("tmiguez.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap
local tnoremap = Remap.tnoremap

nnoremap('<c-q>', ':Ttoggle<CR>')
inoremap('<c-q>', '<Esc>:Ttoggle<CR>')
tnoremap('<c-q>', '<c-\\><c-n>:Ttoggle<CR>')

