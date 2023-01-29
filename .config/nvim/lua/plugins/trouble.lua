return {
  'folke/trouble.nvim',
  config = true,
  keys = {
    { '<leader>xx', '<cmd>TroubleToggle<cr>', desc = 'Trouble Toggle' },
    { '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>', desc = 'Trouble Workspace' },
    { '<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>', desc = 'Trouble Document' },
    { '<leader>xq', '<cmd>TroubleToggle quickfix<cr>', desc = 'Trouble Quickfix' },
    { '<leader>xl', '<cmd>TroubleToggle loclist<cr>', desc = 'Trouble Loclist' },
    { '<leader>xr', '<cmd>TroubleToggle lsp_references<cr>', desc = 'Trouble LSP' },
  }
}
