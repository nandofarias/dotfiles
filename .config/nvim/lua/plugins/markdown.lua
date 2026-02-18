return {
  'MeanderingProgrammer/markdown.nvim',
  main = "render-markdown",
  opts = {
    file_types = { "markdown", "livemd" },
  },
  ft = { "markdown", "livemd" },
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
}
