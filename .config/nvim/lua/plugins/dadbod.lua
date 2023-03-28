return {
  'tpope/vim-dadbod',
  cmd = "DBUI",
  dependencies = {
    'kristijanhusak/vim-dadbod-ui',
    'kristijanhusak/vim-dadbod-completion',
  },
  keys = {
    { '<leader>do', ':DBUI<CR><CR>',  desc = "Database UI Open" },
    { '<leader>dc', ':DBUIClose<CR>', desc = "Database UI Close" },
  },
  config = function()
    vim.opt.cmdheight = 1
    vim.g.db_ui_show_help = 0
    vim.g.db_ui_win_position = 'left'
    vim.g.db_ui_tmp_query_location = '~/Develper/queries'

    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'sql', 'mysql', 'plsql' },
      callback = function()
        require('cmp').setup.buffer({ sources = { { name = 'vim-dadbod-completion' } } })
      end
    })
  end
}
