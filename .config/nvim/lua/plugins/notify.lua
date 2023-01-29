return {
  'rcarriga/nvim-notify',
  dependencies = {
    'stevearc/dressing.nvim',
  },
  config = function()
    local notify = require('notify')
    notify.setup()
    vim.notify = notify
    require('telescope').load_extension('notify')
  end
}
