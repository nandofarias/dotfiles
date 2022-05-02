vim.g['db_ui_winwidth'] = 60
vim.g['db_ui_win_position'] = 'right'
vim.g['db_ui_force_echo_notifications'] = 1

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'sql', 'mysql', 'plsql' },
  callback = function()
    require('cmp').setup.buffer({ sources = { { name = 'vim-dadbod-completion' } } })
  end
})
