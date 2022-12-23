local neogit = require('neogit')

neogit.setup {
  disable_context_highlighting = true,
  integrations = {
    diffview = true
  },
  mappings = {
    status = {
      ['q'] = 'Close',
      ['<esc>'] = 'Close',
    }
  }
}

vim.keymap.set('n', '<Leader>gg', function()
  neogit.open({ kind = 'split' })
end)
