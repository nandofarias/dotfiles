return {
  'vim-test/vim-test',
  dependencies = {
    'preservim/vimux'
  },
  keys = {
    { '<leader>tn', ':TestNearest<CR>', desc = 'Test Nearest' },
    { '<leader>tf', ':TestFile<CR>',    desc = 'Test File' },
    { '<leader>ts', ':TestSuite<CR>',   desc = 'Test Suite' },
    { '<leader>tl', ':TestLast<CR>',    desc = 'Test Last' },
    { '<leader>tg', ':TestVisit<CR>',   desc = 'Test Visit' },
  },
  config = function()
    vim.g['test#strategy'] = 'vimux'
    vim.g['test#preserve_screen'] = 0
    vim.g['test#neovim#term_position'] = 'vert 80'
  end
}
