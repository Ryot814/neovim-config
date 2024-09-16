return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require('nvim-tree').setup({
      sort_by = 'case_sensitive',
      view = {
        adaptive_size = true,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
      },
      on_attach = function(bufnr)
        local api = require('nvim-tree.api')
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set('n', 'u', api.tree.change_root_to_parent, opts)
      end
    })
    
    -- open nvim-tree at startup Neovim
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        require("nvim-tree.api").tree.toggle(false, true)
      end
    })
  end,
}
