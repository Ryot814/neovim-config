return {
  -- add plugin settings here
  { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "navarasu/onedark.nvim" },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
}
