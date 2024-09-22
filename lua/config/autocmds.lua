-- chatGPT example settings
--[[

-- Automatically format when saving a file
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        vim.lsp.buf.format() -- Format the buffer before saving
    end,
})

-- Highlight text on yank (when copying)
vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.highlight.on_yank { higroup = "IncSearch", timeout = 200 } -- Highlight text when you copy it
    end,
})

-- Automatically set line numbers for certain file types
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"gitcommit", "markdown"},
    callback = function()
        vim.opt_local.number = false -- Disable line numbers for git commits and markdown
    end,
})

--]]
