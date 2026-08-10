return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local api = require("nvim-tree.api")

    local function on_attach(bufnr)
      -- Keep the default nvim-tree mappings.
      api.config.mappings.default_on_attach(bufnr)

      local opts = {
        noremap = true,
        silent = true,
        buffer = bufnr,
      }

      vim.keymap.set("n", "o", api.node.open.edit, opts)
      vim.keymap.set("n", "u", api.tree.change_root_to_parent, opts)
    end

    require("nvim-tree").setup({
      sort = {
        sorter = "case_sensitive",
      },

      view = {
        width = {
          min = 30,
        },
      },

      renderer = {
        highlight_git = "name",
        group_empty = true,

        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },

          glyphs = {
            default = "",
            symlink = "",

            folder = {
              default = "",
              open = "",
              symlink = "",
            },

            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
            },
          },
        },
      },

      filters = {
        dotfiles = false,
      },

      on_attach = on_attach,
    })

    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        api.tree.open()
      end,
    })

    vim.keymap.set("n", "<leader>e", api.tree.toggle, {
      silent = true,
      desc = "Toggle file tree",
    })
  end,
}
