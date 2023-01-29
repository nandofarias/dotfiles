return {
  'vim-test/vim-test',
  dependencies = {
    'preservim/vimux',
  },
  keys = {
    { 'tn', ':TestNearest<CR>', desc = 'Test Nearest' },
    { 'tf', ':TestFile<CR>', desc = 'Test File' },
    { 'ts', ':TestSuite<CR>', desc = 'Test Suite' },
    { 'tl', ':TestLast<CR>', desc = 'Test Last' },
    { 'tg', ':TestVisit<CR>', desc = 'Test Visit' },
  },
  config = function()
    vim.g['test#strategy'] = 'vimux'
    vim.g['test#preserve_screen'] = 0
  end
}
