return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-telescope/telescope-frecency.nvim', -- Add frecency plugin
    'nvim-telescope/telescope-project.nvim',
    'tami5/sqlite.lua' -- frecency plugin requires sqlite
  },
  config = function()
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')

    telescope.setup{
      pickers = {
        find_files = {
          -- Use ripgrep to find files, including hidden ones, but ignore .git
          find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
        },
      },
      -- Add more custom settings here
    }

    -- Load the file_browser extension
    telescope.load_extension('file_browser')
    telescope.load_extension('frecency') -- Load frecency extension
    telescope.load_extension('project') -- Add project extension for browsing projects

    -- Set up keymaps for Telescope functions
    vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Find files' })
    vim.keymap.set('n', '<C-g>', builtin.live_grep, { desc = 'Live grep' })
    vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags' })
    vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = 'Grep current word' }) -- Grep the word under the cursor
    vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = 'Recently opened files' }) -- Find recently opened files
    vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Git files' }) -- Find files in a Git repository
    vim.keymap.set('n', '<leader>fq', builtin.quickfix, { desc = 'Quickfix list' }) -- Show quickfix list
    
    -- Set up keymap for file_browser extension
    vim.keymap.set('n', '<space>fb', ':Telescope file_browser<CR>', { noremap = true, desc = 'File browser' })

    -- Set up keymap for frecency extension
    vim.keymap.set('n', '<leader>fr', function() telescope.extensions.frecency.frecency() end, { desc = 'Telescope frecency' })

    -- Browse projects
    vim.keymap.set('n', '<leader>fp', function() telescope.extensions.project.project{} end, { desc = 'Project browser' })
    
  end
}
