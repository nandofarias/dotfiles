return {
  'pwntester/octo.nvim',
  cmd = { 'Octo' },
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('octo').setup({
      default_remote = { 'origin' },
    })

    vim.treesitter.language.register('markdown', 'octo')
  end
}
