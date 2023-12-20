return {
  'LunarVim/bigfile.nvim',
  event = 'BufReadPre',
  config = function()
    require('bigfile').setup({
      filesize = 0.5,
      features = {  -- features to disable
        "indent_blankline",
        "illuminate",
        "lsp",
        "treesitter",
        "syntax",
        "matchparen",
        "vimopts",
        "filetype",
      },
    })
  end,
}
