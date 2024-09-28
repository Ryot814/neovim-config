return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- Set up nvim-tree with additional settings
    require('nvim-tree').setup({
      sort_by = 'case_sensitive',  -- Sort files with case sensitivity
      view = {
        adaptive_size = true,  -- Automatically adjust the size of the tree window
      },
      renderer = {
        highlight_git = true,  -- Highlight git changes in the file tree
        group_empty = true,  -- Group empty folders together
        icons = {
          show = {
            file = true,  -- Show icons for files
            folder = true,  -- Show icons for folders
            folder_arrow = true,  -- Show arrows next to folders
            git = true,  -- Show icons for git status
          },
          glyphs = {
            default = "",  -- Icon for a default file
            symlink = "",  -- Icon for a symbolic link
            folder = {
              default = "",  -- Icon for a closed folder
              open = "",  -- Icon for an open folder
              symlink = "",  -- Icon for a folder symlink
            },
            git = {
              unstaged = "✗",  -- Icon for unstaged changes
              staged = "✓",  -- Icon for staged changes
              unmerged = "",  -- Icon for unmerged files
              renamed = "➜",  -- Icon for renamed files
              untracked = "★",  -- Icon for untracked files
            },
          },
        },
      },
      filters = {
        dotfiles = false,  -- Hide dotfiles by default
      },
      on_attach = function(bufnr)
        local api = require('nvim-tree.api')
        local opts = { noremap = true, silent = true, buffer = bufnr }

        -- Map 'o' key to open a file or directory
        vim.keymap.set('n', 'o', api.node.open.edit, opts)

        -- Map 'u' key to move to the parent directory in the tree
        vim.keymap.set('n', 'u', api.tree.change_root_to_parent, opts)
      end
    })
    
    -- Open nvim-tree at startup Neovim
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        require("nvim-tree.api").tree.toggle(false, true)
      end
    })

    -- Keymap to toggle nvim-tree with <leader>e
    vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', {silent=true})
  end,
}

