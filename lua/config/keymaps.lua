-- Key mapping settings
local keymap = vim.keymap.set
keymap('n', '<C-j>', '<esc>', { noremap = true, silent = true })      -- In normal mode, Ctrl+j acts as escape
keymap('i', '<C-j>', '<esc>', { noremap = true, silent = true })      -- In insert mode, Ctrl+j acts as escape
keymap('n', '<S-Tab>', '<<', { noremap = true, silent = true })       -- In normal mode, Shift+Tab un-indents
keymap('i', '<S-Tab>', '<C-D>', { noremap = true, silent = true })    -- In insert mode, Shift+Tab un-indents
keymap('v', '<S-Tab>', '<', { noremap = true, silent = true })        -- In visual mode, Shift+Tab un-indents

-- chatGPT example settings
--[[

-- Set the leader key to space
vim.g.mapleader = " "

-- Save file with <leader> + s
vim.keymap.set("n", "<leader>s", ":w<CR>", { noremap = true, silent = true })
-- Save and quit with <leader> + q
vim.keymap.set("n", "<leader>q", ":wq<CR>", { noremap = true, silent = true })

-- Easier window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true }) -- Move left between windows
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true }) -- Move down between windows
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true }) -- Move up between windows
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true }) -- Move right between windows

-- LSP keymaps
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true }) -- Go to definition
vim.keymap.set("n", "gr", vim.lsp.buf.references, { noremap = true, silent = true }) -- Find references
vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true })       -- Show hover information

--]]
