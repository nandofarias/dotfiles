return {
  'folke/zen-mode.nvim',
  dependencies = {
    { 'folke/twilight.nvim', config = true },
  },
  keys = {
    {
      '<Leader>z',
      function()
        require('zen-mode').toggle({
          window = {
            width = .6
          }
        })
      end,
      desc = 'Zen Toggle'
    }
  },
  config = function()
    require('zen-mode').setup({
      plugins = {
        twilight = { enabled = false },
        tmux = { enabled = true },
      },
    })
  end
}
