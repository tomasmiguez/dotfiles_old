for file in vim.fs.dir('~/.config/nvim/lua/tmiguez/config') do
  if file ~= 'init.lua' then
    require('tmiguez.config.' .. file:gsub('%.lua', ''))
  end
end

