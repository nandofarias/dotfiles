local vimp = require('vimp')
local neogit = require('neogit')

neogit.setup {
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
vimp.nnoremap('<C-g>', function()
  neogit.open({ kind = 'split_above' })
end)
