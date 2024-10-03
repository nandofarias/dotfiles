return {
  'MeanderingProgrammer/markdown.nvim',
  main = "render-markdown",
  opts = {
    file_types = { "markdown", "livemd", "Avante", },
  },
  ft = { "markdown", "livemd", "Avante", },
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
}
