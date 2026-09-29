return {
  'MeanderingProgrammer/markdown.nvim',
  main = "render-markdown",
  opts = {
    file_types = { "markdown", "livemd" },
  },
  ft = { "markdown", "livemd" },
  dependencies = { 'arborist-ts/arborist.nvim', 'nvim-tree/nvim-web-devicons' },
}
