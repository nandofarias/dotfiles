return {
  'akinsho/git-conflict.nvim',
  version = "*",
  config = function()
    require('git-conflict').setup()

    vim.keymap.set('n', '<leader>gc', ':GitConflictListQf<CR>', { desc = 'Open conflicts' })
  end
}
