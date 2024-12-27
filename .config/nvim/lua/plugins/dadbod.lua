return {
  'tpope/vim-dadbod',
  cmd = "DBUI",
  dependencies = {
    'kristijanhusak/vim-dadbod-ui',
  },
  keys = {
    { '<leader>do', ':DBUI<CR><CR>',  desc = "Database UI Open" },
    { '<leader>dc', ':DBUIClose<CR>', desc = "Database UI Close" },
  },
  config = function()
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_force_echo_notifications = 1
    vim.opt.cmdheight = 1
    vim.g.db_ui_show_help = 0
    vim.g.db_ui_win_position = 'left'
    vim.g.db_ui_tmp_query_location = '~/Developer/queries'
  end
}
