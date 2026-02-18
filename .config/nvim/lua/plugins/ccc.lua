return {
  'uga-rosa/ccc.nvim',
  cmd = { "CccPick", "CccHighlighterToggle", "CccHighlighterEnable" },
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    highlighter = {
      auto_enable = true,
    },
  },
}
