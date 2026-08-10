-- Automatically enter insert mode when opening a terminal
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    command = "startinsert"
})

-- Disable relative line numbers in terminal mode
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    command = "setlocal norelativenumber"
})

-- Disable absolute line numbers in terminal mode
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    command = "setlocal nonumber"
})


-- --- GhostText Config ---

-- Neovim起動時にサーバー自動起動
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    vim.fn['ghost#load']()
  end,
})

-- Overleafならファイルタイプをtexにする
vim.api.nvim_create_autocmd("User", {
  pattern = "vim-ghost#connected",
  callback = function()
    if string.match(vim.fn.expand("%:p"), "overleaf.com") then
      vim.bo.filetype = "tex"
    end
  end,
})
