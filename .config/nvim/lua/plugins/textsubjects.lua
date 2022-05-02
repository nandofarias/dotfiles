require('nvim-treesitter.configs').setup {
  textsubjects = {
    enable = true,
    keymaps = {
      ['.'] = 'textsubjects-smart',
    }
  }
}
