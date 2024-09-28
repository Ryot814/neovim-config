-- This file will load all plugin configurations from the 'plugins' directory
local plugin_files = vim.fn.globpath(vim.fn.stdpath('config') .. '/lua/plugins', '*.lua', false, true)
local plugins = {}

for _, file in ipairs(plugin_files) do
  local filename = vim.fn.fnamemodify(file, ':t:r')
  -- Skip loading this file (init.lua) to avoid recursion
  if filename ~= 'init' then
    local ok, plugin = pcall(require, 'plugins.' .. filename)
    if ok then
      -- If the plugin file returns a table, extend our plugins table
      if type(plugin) == 'table' then
        for _, p in ipairs(plugin) do
          table.insert(plugins, p)
        end
      end
    else
      vim.notify('Failed to load plugin file: ' .. filename, vim.log.levels.ERROR)
    end
  end
end

-- Remove onedark.lua from the plugins list as requested
for i, plugin in ipairs(plugins) do
  if type(plugin) == 'table' and plugin[1] == 'navarasu/onedark.nvim' then
    table.remove(plugins, i)
    break
  end
end

return plugins
