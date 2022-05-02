require('telescope').load_extension('notify')
require('notify').setup({
  background_colour = '#202020',
})
vim.notify = require('notify')
