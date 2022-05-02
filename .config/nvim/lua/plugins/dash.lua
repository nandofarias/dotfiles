local vimp = require('vimp')
vimp.nnoremap('<leader>d', function ()
  require('dash').search(true)
end)
