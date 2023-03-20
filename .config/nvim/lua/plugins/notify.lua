return {
  'rcarriga/nvim-notify',
  dependencies = {
    'stevearc/dressing.nvim',
  },
  config = function()
    local notify = require('notify')
    notify.setup({
      background_colour = '#000000',
    })
    vim.notify = notify
    require('telescope').load_extension('notify')
  end
}
