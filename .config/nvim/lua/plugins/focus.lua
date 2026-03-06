return {
  'nvim-focus/focus.nvim',
  lazy = false,
  version = '*',
  keys = {
    { '<leader>sn', function() require('focus').split_nicely() end, { desc = 'split nicely' } }
  },
  config = function()
    require('focus').setup({
      autoresize = { enable = false },
    })
  end,
}
