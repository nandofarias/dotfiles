return {
  'bennypowers/nvim-regexplainer',
  dependencies = {
    'MunifTanjim/nui.nvim'
  },
  config = function()
    require('regexplainer').setup {
      mappings = {
        toggle = '<leader>re',
        hide = '<leader>rc',
      },
    }
  end
}
