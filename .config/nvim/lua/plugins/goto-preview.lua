require('goto-preview').setup {
  post_open_hook = function()
    vim.cmd [[nnoremap <buffer> <esc> :q<CR>]]
    vim.cmd [[nnoremap <buffer> q :q<CR>]]
  end
}
vim.keymap.set('n', 'gpd', "<cmd>lua require('goto-preview').goto_preview_definition()<CR>")
vim.keymap.set('n', 'gpi', "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
vim.keymap.set('n', 'gpq', "<cmd>lua require('goto-preview').close_all_win()<CR>")
vim.keymap.set('n', 'gpr', "<cmd>lua require('goto-preview').goto_preview_references()<CR>")
