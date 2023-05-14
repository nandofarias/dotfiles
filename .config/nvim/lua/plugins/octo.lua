return {
  'pwntester/octo.nvim',
  cmd = { 'Octo' },
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('octo').setup({
      default_remote = { 'origin' },
    })

    vim.treesitter.language.register('markdown', 'octo')
  end
}
