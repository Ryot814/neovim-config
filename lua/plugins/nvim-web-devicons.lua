return {
  'nvim-tree/nvim-web-devicons',
  config = function()
    require('nvim-web-devicons').setup {
      -- オプションでデフォルトのアイコンをオーバーライドできます
      -- override = {
      --   zsh = {
      --     icon = "",
      --     color = "#428850",
      --     cterm_color = "65",
      --     name = "Zsh"
      --   }
      -- },
      -- グローバルなオーバーライドを行うこともできます
      -- override_by_filename = {
      --  [".gitignore"] = {
      --    icon = "",
      --    color = "#f1502f",
      --    name = "Gitignore"
      --  }
      -- },
      -- デフォルトのアイコンを使用する場合は空の設定で十分です
    }
  end
}
