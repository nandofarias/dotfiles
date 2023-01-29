return {
  'AckslD/messages.nvim',
  config = function()
    require('messages').setup({
      post_open_float = function(winnr)
        vim.keymap.set('n', '<esc>', function() vim.api.nvim_win_close(winnr, false) end,
          { silent = true, buffer = true })
      end
    })
  end
}
