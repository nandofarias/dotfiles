local vimp = require('vimp')

require('goto-preview').setup {
  post_open_hook = function()
    vim.cmd [[nnoremap <buffer> <esc> :q<CR>]]
    vim.cmd [[nnoremap <buffer> q :q<CR>]]
  end
}
vimp.nnoremap('gpd', "<cmd>lua require('goto-preview').goto_preview_definition()<CR>")
vimp.nnoremap('gpi', "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
vimp.nnoremap('gpq', "<cmd>lua require('goto-preview').close_all_win()<CR>")
vimp.nnoremap('gpr', "<cmd>lua require('goto-preview').goto_preview_references()<CR>")
