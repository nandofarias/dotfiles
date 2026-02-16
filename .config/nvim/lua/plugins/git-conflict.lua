return {
  'akinsho/git-conflict.nvim',
  version = "*",
  config = function()
    require('git-conflict').setup()

    vim.keymap.set('n', '<leader>gc', ':GitConflictListQf<CR>', { desc = 'Open conflicts' })
    vim.keymap.set('n', '<leader>go', ':GitConflictListQf<CR>', { desc = 'Open conflicts' })
    vim.keymap.set('n', '<leader>gt', ':GitConflictListQf<CR>', { desc = 'Open conflicts' })
  end
}
