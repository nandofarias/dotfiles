require('dash').setup({})

local vimp = require('vimp')
vimp.nnoremap('<leader>d', ':DashWord! <CR>')
