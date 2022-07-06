require('dash').setup({})

local vimp = require('vimp')
vimp.nnoremap('<leader>df', ':DashWord! <CR>')
