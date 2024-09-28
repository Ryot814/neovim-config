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

