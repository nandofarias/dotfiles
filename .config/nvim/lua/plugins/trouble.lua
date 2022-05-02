local vimp = require('vimp')

require("trouble").setup {}

vimp.nnoremap('<leader>xx', '<cmd>TroubleToggle<cr>')
vimp.nnoremap('<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>')
vimp.nnoremap('<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>')
vimp.nnoremap('<leader>xq', '<cmd>TroubleToggle quickfix<cr>')
vimp.nnoremap('<leader>xl', '<cmd>TroubleToggle loclist<cr>')
vimp.nnoremap('<leader>xr', '<cmd>TroubleToggle lsp_references<cr>')
