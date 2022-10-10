-- Remove trailing whitespaces on save
vim.cmd [[
function! StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre * :call StripTrailingWhitespaces()
]]
