-- Key mapping settings
local keymap = vim.keymap.set
keymap('n', '<C-j>', '<esc>', { noremap = true, silent = true })      -- In normal mode, Ctrl+j acts as escape
keymap('i', '<C-j>', '<esc>', { noremap = true, silent = true })      -- In insert mode, Ctrl+j acts as escape
keymap('i', 'jj', '<esc>', { noremap = true, silent = true })         -- In insert mode, jj acts as escape
-- keymap('n', 'jj', '<esc>', { noremap = true, silent = true })         -- In insert mode, jj acts as escape
keymap('n', '<S-Tab>', '<<', { noremap = true, silent = true })       -- In normal mode, Shift+Tab un-indents
keymap('i', '<S-Tab>', '<C-D>', { noremap = true, silent = true })    -- In insert mode, Shift+Tab un-indents
keymap('v', '<S-Tab>', '<', { noremap = true, silent = true })        -- In visual mode, Shift+Tab un-indents

keymap('n', 'tt', '<cmd>terminal<CR>', { noremap = true, silent = true }) -- In normal mode, 'tt' opens a terminal
keymap('n', 'tx', '<cmd>belowright new<CR><cmd>terminal<CR>', { noremap = true, silent = true }) -- In normal mode, 'tx' opens a new terminal window below the current one

--keymap('t', '<ESC>', '<C-\\><C-n>')
keymap('t', '<C-j>', '<C-\\><C-n>', { noremap = true, silent = true }) -- In terminal mode, Ctrl+j acts as escape

local apikeymap = vim.api.nvim_set_keymap
apikeymap('n', '<Tab>', '>>', { noremap = true, silent = true })       -- In normal mode, Tab acts an indent
apikeymap('v', '<Tab>', '>gv', { noremap = true, silent = true })       -- In visual mode, Tab acts an indent

apikeymap('n', '<C-h>', ':bprevious<CR>', { noremap = true, silent = true }) -- In normal mode, <C-h> moves to the previous buffer
apikeymap('n', '<C-l>', ':bnext<CR>', { noremap = true, silent = true }) -- In normal mode, <C-l> moves to the next buffer

