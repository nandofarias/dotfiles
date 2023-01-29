return {
  'rest-nvim/rest.nvim',
  config = true,
  keys = {
    { '<leader>rf', '<Plug>RestNvim<CR>' },
    { '<leader>rl', '<Plug>RestNvimLast<CR>' },
    { '<leader>rp', '<Plug>RestNvimPreview<CR>' },
  }
}
