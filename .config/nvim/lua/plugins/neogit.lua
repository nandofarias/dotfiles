local vimp = require('vimp')
local neogit = require('neogit')

neogit.setup{
  integrations = {
    diffview = true
  }
}
vimp.nnoremap('<C-g>', neogit.open)
