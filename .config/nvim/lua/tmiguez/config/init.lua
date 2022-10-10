-- Auto import every file in this directory
-- TODO how to make it relative to nvim config folder?
for file in vim.fs.dir('~/.config/nvim/lua/tmiguez/config') do
  if file ~= 'init.lua' then
    require('tmiguez.config.' .. file:gsub('%.lua', ''))
  end
end

