return {
  'bennypowers/nvim-regexplainer',
  dependencies = {
    'MunifTanjim/nui.nvim'
  },
  config = function()
    require('regexplainer').setup {
      auto = true,
      mappings = {
        toggle = 'gR',
      },
    }
  end
}
