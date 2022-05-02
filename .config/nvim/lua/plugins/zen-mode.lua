local vimp = require('vimp')
local zen = require('zen-mode')

zen.setup {}

vimp.nnoremap('<Leader>z', function()
  zen.toggle({
    window = {
      width = .85 -- width will be 85% of the editor width
    }
  })
end)
