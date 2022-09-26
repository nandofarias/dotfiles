vim.cmd [[au VimEnter * hi StatusLine gui=none guibg=none guifg=none]]

local dracula_pro = require'plugins.lualine.themes.dracula-pro'
require('lualine').setup {
  options = {
    theme = dracula_pro,
    disabled_filetypes = {
      "dashboard",
      "NvimTree",
      "TelescopePrompt",
      "TelescopeResults",
    },
    component_separators = '|',
    section_separators = { left = '', right = '' },
    globalstatus = true,
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename', 'lsp_progress' },
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
}
