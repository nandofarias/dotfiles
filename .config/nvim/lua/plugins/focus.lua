return {
  'nvim-focus/focus.nvim',
  version = '*',
  keys = {
    { '<leader>sn', function() require('focus').split_nicely() end, { desc = 'split nicely' } }
  },
  setup = true,
}