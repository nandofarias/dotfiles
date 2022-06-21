local vimp = require('vimp')
local zen = require('zen-mode')

zen.setup({
  plugins = {
    twilight = { enabled = false },
    tmux = { enabled = true },
  },
})

vimp.nnoremap('<Leader>z', function()
  zen.toggle({
    window = {
      width = .6
    }
  })
end)
