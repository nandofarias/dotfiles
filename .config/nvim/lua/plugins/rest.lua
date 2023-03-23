return {
  'rest-nvim/rest.nvim',
  config = true,
  keys = {
    { '<leader>rf', '<Plug>RestNvim<CR>',        desc = "HTTP Request" },
    { '<leader>rl', '<Plug>RestNvimLast<CR>',    desc = "HTTP Last Request" },
    { '<leader>rp', '<Plug>RestNvimPreview<CR>', desc = "HTTP Preview" },
  }
}
