return {
  'rcarriga/nvim-notify',
  dependencies = {
    'stevearc/dressing.nvim',
  },
  config = function()
    local notify = require('notify')
    notify.setup({
      background_colour = '#000000',
      max_width = 120,
      level = vim.log.levels.WARN,
    })
    vim.notify = notify
    require('telescope').load_extension('notify')
  end
}
