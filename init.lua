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

-- read basic settings
require('config.options')

-- plugin settings
require("lazy").setup("plugins")

-- keymap
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', {silent=true})
