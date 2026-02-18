return {
  'akinsho/git-conflict.nvim',
  version = "*",
  event = "BufReadPost",
  opts = {},
  keys = {
    { '<leader>gx', '<cmd>GitConflictListQf<cr>',     desc = 'List Conflicts' },
    { '<leader>co', '<cmd>GitConflictChooseOurs<cr>',   desc = 'Choose Ours' },
    { '<leader>ct', '<cmd>GitConflictChooseTheirs<cr>', desc = 'Choose Theirs' },
    { '<leader>cb', '<cmd>GitConflictChooseBoth<cr>',   desc = 'Choose Both' },
    { '<leader>cn', '<cmd>GitConflictNextConflict<cr>', desc = 'Next Conflict' },
    { '<leader>cp', '<cmd>GitConflictPrevConflict<cr>', desc = 'Prev Conflict' },
  },
}
