local opt = vim.opt

-- Basic settings
opt.number = true           -- Show line numbers
opt.expandtab = true        -- Convert tabs to spaces
opt.title = true            -- Show the title
opt.showmatch = true        -- Highlight matching parentheses
opt.tabstop = 2             -- Set tab width to 2 spaces
opt.ignorecase = true       -- Ignore case in search
opt.smartcase = true        -- Use case-sensitive search when uppercase letters are used
opt.wrapscan = true         -- Continue search from the end of file to the beginning
vim.cmd('syntax on')        -- Enable syntax highlighting

-- When you type symbols like "※", they overlap with half-width characters. This setting displays symbols like "※" with full-width.
opt.ambiwidth = 'double'

-- When you add a new line, it inherits the indentation from the line above.
opt.autoindent = true
opt.smartindent = true

-- When both smartindent and cindent are true, only cindent will be true
opt.cindent = true

-- Highlight the line where the cursor is.
opt.cursorline = true

-- If you want to highlight the column where the cursor is, set the following to true.
-- opt.cursorcolumn = true

-- When you press the TAB key, it shows a TAB with a width of 2 characters.
opt.softtabstop = 2
opt.shiftwidth = 2

-- Displays relative line numbers from the cursor line.
opt.relativenumber = true
opt.termguicolors = true

