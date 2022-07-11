vim.cmd [[ au VimEnter * highlight IndentBlanklineChar guifg=#202020 gui=nocombine ]]
vim.cmd [[ au VimEnter * highlight IndentBlanklineContextChar guifg=#454545 gui=nocombine ]]

require("indent_blankline").setup {
  enabled = true,
  use_treesitter = true,
  show_first_indent_level = false,
  show_trailing_blankline_indent = false,
  show_current_context = true,
  filetype_exclude = {
    "help",
    "terminal",
    "dashboard",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "NvimTree",
    "packer",
    "dbout",
  },
  buftype_exclude = { "terminal" },
}
