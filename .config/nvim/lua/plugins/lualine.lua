return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local colors = require("tokyonight.colors").setup({ style = "moon" })
    local tokyonight = require("lualine.themes.tokyonight-moon")

    -- Pin section backgrounds so pills always render with transparent bg
    tokyonight.normal.a = { bg = colors.blue, fg = colors.black, gui = "bold" }
    tokyonight.normal.b = { bg = colors.fg_gutter, fg = colors.blue }
    tokyonight.normal.c = { bg = "none", fg = colors.fg_sidebar }
    tokyonight.insert.a = { bg = colors.green, fg = colors.black, gui = "bold" }
    tokyonight.command.a = { bg = colors.yellow, fg = colors.black, gui = "bold" }
    tokyonight.visual.a = { bg = colors.magenta, fg = colors.black, gui = "bold" }
    tokyonight.replace.a = { bg = colors.red, fg = colors.black, gui = "bold" }
    tokyonight.terminal.a = { bg = colors.green1, fg = colors.black, gui = "bold" }

    require("lualine").setup({
      options = {
        theme = tokyonight,
        disabled_filetypes = {
          "dashboard",
          "TelescopePrompt",
          "TelescopeResults",
        },
        component_separators = "|",
        section_separators = { left = "\u{e0b4}", right = "\u{e0b6}" },
        globalstatus = true,
      },
      sections = {
        lualine_a = {
          { "mode", separator = { left = "\u{e0b6}" }, right_padding = 2 },
        },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = {
          "filename",
          function()
            return require("lsp-progress").progress()
          end,
        },
        lualine_x = {
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = { bg = "none", fg = "#ff966c" },
          },
        },
        lualine_y = { "filetype", "progress" },
        lualine_z = {
          { "location", separator = { right = "\u{e0b4}" }, left_padding = 2 },
        },
      },
    })
  end,
}
