local zen = require('zen-mode')

zen.setup({
  plugins = {
    twilight = { enabled = false },
    tmux = { enabled = true },
  },
})

vim.keymap.set('n', '<Leader>z', function()
  zen.toggle({
    window = {
      width = .6
    }
  })
end)
