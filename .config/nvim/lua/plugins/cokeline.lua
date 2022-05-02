vim.cmd [[au VimEnter * hi TabLineFill gui=none guifg=none guibg=none]]
local map = vim.api.nvim_set_keymap

local get_hex = require('cokeline/utils').get_hex
local green = vim.g.terminal_color_2
local errors_fg = get_hex('DiagnosticError', 'fg')
local warnings_fg = get_hex('DiagnosticWarn', 'fg')
local default_bg = '#22212C'

require('cokeline').setup({
  buffers = {
    new_buffers_position = 'next',
  },
  default_hl = {
    fg = function(buffer)
      return
        buffer.is_focused
        and get_hex('Normal', 'fg')
         or get_hex('Comment', 'fg')
    end,
    bg = default_bg,
  },
  sidebar = {
    filetype = 'NvimTree',
    components = {
      {
        text = '  NvimTree',
        style = 'bold',
        bg = 'none',
      },
    }
  },
  components = {
    {
      text = ' ',
      bg = 'none',
    },
    {
      text = '',
      bg = 'none',
      fg = default_bg,
    },
    {
      text = function(buffer)
        return buffer.devicon.icon
      end,
      fg = function(buffer)
        return buffer.devicon.color
      end,
    },
    {
      text = ' ',
    },
    {
      text = function(buffer) return buffer.filename end,
      style = function(buffer)
        return buffer.is_focused and 'bold' or nil
      end,
    },
    {
      text = function(buffer)
        return
          (buffer.diagnostics.errors ~= 0 and '  ' .. buffer.diagnostics.errors)
          or (buffer.diagnostics.warnings ~= 0 and ' ⚠ ' .. buffer.diagnostics.warnings)
          or ''
      end,
      fg = function(buffer)
        return
          (buffer.diagnostics.errors ~= 0 and errors_fg)
          or (buffer.diagnostics.warnings ~= 0 and warnings_fg)
          or nil
      end,
      truncation = { priority = 1 },
    },
    {
      text = ' ',
    },
    {
      text = function(buffer)
        return buffer.is_modified and '●' or ''
      end,
      fg = function(buffer)
        return buffer.is_modified and green or nil
      end,
      delete_buffer_on_left_click = true,
      truncation = { priority = 1 },
    },
    {
      text = '',
      bg = 'none',
      fg = default_bg,
    },
  },
})
map('n', '<S-Tab>',   '<Plug>(cokeline-focus-prev)',  { silent = true })
map('n', '<Tab>',     '<Plug>(cokeline-focus-next)',  { silent = true })

for i = 1,9 do
  map('n', ('<Leader>%s'):format(i), ('<Plug>(cokeline-focus-%s)'):format(i), { silent = true })
end

