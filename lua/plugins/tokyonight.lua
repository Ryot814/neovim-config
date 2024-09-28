return {
  'folke/tokyonight.nvim',
  config = function()
    require('tokyonight').setup {
      style = 'night',
    }
    require('tokyonight').load()
  end
}
