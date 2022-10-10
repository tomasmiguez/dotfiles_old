local Remap = require("tmiguez.keymap")
local nnoremap = Remap.nnoremap

local builtin = require('telescope.builtin')

function with_params(fn, params)
  return function()
    return fn(params)
  end
end

function with_no_ignore(fn)
  return with_params(fn, {no_ignore=true})
end

function with_path(fn)
  return function()
    path = vim.fn.input("Dir: ", "", "dir")
    return fn({search_dirs = {path}})
  end
end

nnoremap('<leader><space>', with_no_ignore(builtin.find_files))
nnoremap('<leader>ff', with_no_ignore(builtin.live_grep))
nnoremap('<leader>FF', with_no_ignore(builtin.grep_string))
nnoremap('<leader>fb', builtin.buffers)
nnoremap('<leader>fn', builtin.git_files)
nnoremap('<leader>fg', builtin.git_branches)
nnoremap('<leader>fs', builtin.lsp_document_symbols)
nnoremap('<leader>fd', with_path(builtin.find_files))
nnoremap('<leader>fD', with_path(builtin.live_grep))
