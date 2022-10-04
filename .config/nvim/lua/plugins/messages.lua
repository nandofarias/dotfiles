local vimp = require('vimp')

require('messages').setup({
  post_open_float = function(winnr)
    vimp.nnoremap({ 'silent', 'buffer' }, '<esc>', function() vim.api.nvim_win_close(winnr, false) end)
  end
})
