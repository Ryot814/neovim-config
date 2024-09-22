local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- user latest version
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load options
require("config.options") -- Load general options
require("config.keymaps") -- Load custom key mappings
require("config.autocmds") -- Load autocommands

-- plugin settings
require("lazy").setup("plugins")

