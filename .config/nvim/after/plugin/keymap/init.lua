local Remap = require("tmiguez.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local onoremap = Remap.onoremap

local silent = { silent = true }

-- Hide highlight after search
nnoremap('<leader>vs', '<cmd>nohl<CR>', silent)

-- Tabs related keybinds
nnoremap('<leader>vto', '<cmd>tabnew<CR>', silent)
nnoremap('<leader>vtd', '<cmd>tabclose<CR>', silent)
nnoremap('<leader>vtn', '<cmd>tabnext<CR>', silent)
nnoremap('<leader>vtp', '<cmd>tabprevious<CR>', silent)

-- Quickfix list related keybinds
nnoremap('<leader>vqc', '<cmd>cc<CR>', silent)
nnoremap('<leader>vqn', '<cmd>cnext<CR>', silent)
nnoremap('<leader>vqp', '<cmd>cprevious<CR>', silent)

-- Jump to the next or previous line that has the same level or a lower
-- level of indentation than the current line.
--
-- exclusive (bool): true: Motion is exclusive
-- false: Motion is inclusive
-- fwd (bool): true: Go to next line
-- false: Go to previous line
-- lowerlevel (bool): true: Go to line with lower indentation level
-- false: Go to line with the same indentation level
-- skipblanks (bool): true: Skip blank lines
-- false: Don't skip blank lines
vim.cmd [[
function! NextIndent(exclusive, fwd, lowerlevel, skipblanks)
  let line = line('.')
  let column = col('.')
  let lastline = line('$')
  let indent = indent(line)
  let stepvalue = a:fwd ? 1 : -1
  while (line > 0 && line <= lastline)
    let line = line + stepvalue
    if ( ! a:lowerlevel && indent(line) == indent ||
          \ a:lowerlevel && indent(line) < indent)
      if (! a:skipblanks || strlen(getline(line)) > 0)
        if (a:exclusive)
          let line = line - stepvalue
        endif
        exe line
        exe "normal " column . "|"
        return
      endif
    endif
  endwhile
endfunction
]]

-- Moving back and forth between lines of same or lower indentation.
nnoremap('[l', '<cmd>call NextIndent(0, 0, 0, 1)<CR>', silent)
nnoremap(']l', '<cmd>call NextIndent(0, 1, 0, 1)<CR>', silent)
nnoremap('[L', '<cmd>call NextIndent(0, 0, 1, 1)<CR>', silent)
nnoremap(']L', '<cmd>call NextIndent(0, 1, 1, 1)<CR>', silent)
onoremap('[l', '<cmd>call NextIndent(0, 0, 0, 1)<CR>', silent)
onoremap(']l', '<cmd>call NextIndent(0, 1, 0, 1)<CR>', silent)
onoremap('[L', '<cmd>call NextIndent(1, 0, 1, 1)<CR>', silent)
onoremap(']L', '<cmd>call NextIndent(1, 1, 1, 1)<CR>', silent)
vnoremap('[l', "<Esc><cmd>call NextIndent(0, 0, 0, 1)<CR>m'gv''", silent)
vnoremap(']l', "<Esc><cmd>call NextIndent(0, 1, 0, 1)<CR>m'gv''", silent)
vnoremap('[L', "<Esc><cmd>call NextIndent(0, 0, 1, 1)<CR>m'gv''", silent)
vnoremap(']L', "<Esc><cmd>call NextIndent(0, 1, 1, 1)<CR>m'gv''", silent)

function ToggleHighlight()
  vim.o.cursorcolumn = not vim.o.cursorcolumn
  vim.o.cursorline   = not vim.o.cursorline
end

function BlinkCursor()
  ToggleHighlight()

  vim.defer_fn(ToggleHighlight, 1000)
end

nnoremap('<leader>cb', BlinkCursor, silent)
