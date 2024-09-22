return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-file-browser.nvim'
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

    -- Set up keymaps for Telescope functions
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags' })
    
    -- Set up keymap for file_browser extension
    vim.keymap.set('n', '<space>fb', ':Telescope file_browser<CR>', { noremap = true, desc = 'File browser' })
  end
}
