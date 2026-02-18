return {
  'nvim-focus/focus.nvim',
  lazy = false,
  version = '*',
  keys = {
    { '<leader>sn', function() require('focus').split_nicely() end, { desc = 'split nicely' } }
  },
  config = true,
}
