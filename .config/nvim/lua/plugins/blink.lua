return {
  {
    'saghen/blink.compat',
    version = '*',
    lazy = true,
    opts = {
      impersonate_nvim_cmp = true,
    },
  },
  {
    'saghen/blink.cmp',
    dependencies = {
      'rafamadriz/friendly-snippets',
      'hrsh7th/cmp-nvim-lua',
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
    version = '*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' for mappings similar to built-in completion
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      -- See the full 'keymap' documentation for information on defining your own keymap.
      keymap = {
        preset = 'enter',
        ["<CR>"] = {
          function(cmp)
            local ok, supermaven = pcall(require, "supermaven-nvim.completion_preview")
            if ok and supermaven.has_suggestion() then
              vim.schedule(supermaven.on_accept_suggestion)
              return true
            end
          end,
          "accept",
          "fallback",
        },
      },
      enabled = function()
        return vim.bo.buftype ~= "prompt" and
            vim.bo.buftype ~= "NvimTree" and
            vim.bo.buftype ~= "TelescopePrompt" and
            vim.bo.filetype ~= "DressingInput" and
            vim.b.completion ~= false
      end,
      signature = {
        enabled = true,
        window = {
          winblend = 0,
        },
      },
      completion = {
        documentation = {
          auto_show = true,
          window = {
            border = 'rounded',
            winblend = 0,
          },
        },
        menu = {
          draw = {
            columns = { { 'label', gap = 1 }, { 'kind_icon', 'kind' } },
            treesitter = { 'lsp' },
          },
          border = 'rounded',
          winblend = 0,
          winhighlight =
          'Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None',
        },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
        kind_icons = {
          Text = '󰉿 ',
          Method = '󰊕 ',
          Function = '󰊕 ',
          Constructor = '󰒓 ',

          Field = '󰜢 ',
          Variable = '󰆦 ',
          Property = '󰖷 ',

          Class = '󱡠 ',
          Interface = '󱡠 ',
          Struct = '󱡠 ',
          Module = '󰅩 ',

          Unit = '󰪚 ',
          Value = '󰦨 ',
          Enum = '󰦨 ',
          EnumMember = '󰦨 ',

          Keyword = '󰻾 ',
          Constant = '󰏿 ',

          Snippet = '󱄽 ',
          Color = '󰏘 ',
          File = '󰈔 ',
          Reference = '󰬲 ',
          Folder = '󰉋 ',
          Event = '󱐋 ',
          Operator = '󰪚 ',
          TypeParameter = '󰬛 ',

          Supermaven = ' ',
        },
      },
      cmdline = {
        enabled = false,
        sources = function() return {} end,
      },
      sources = {
        default = { 'supermaven', 'lsp', 'path', 'snippets', 'buffer', 'nvim_lua', 'obsidian', 'obsidian_new', 'obsidian_tags', 'dadbod' },
        providers = {
          supermaven = {
            name = 'supermaven',
            module = 'blink.compat.source',
            score_offset = 1,
            transform_items = function(ctx, items)
              local kind = 'Supermaven'
              require("blink.cmp.types").CompletionItemKind[kind] = kind
              for i, _ in ipairs(items) do
                items[i].kind = kind
              end
              return items
            end,
          },
          nvim_lua = {
            name = 'nvim_lua',
            module = 'blink.compat.source',
          },
          obsidian = {
            name = "obsidian",
            module = "blink.compat.source",
          },
          obsidian_new = {
            name = "obsidian_new",
            module = "blink.compat.source",
          },
          obsidian_tags = {
            name = "obsidian_tags",
            module = "blink.compat.source",
          },
          dadbod = {
            name = "Dadbod",
            module = "vim_dadbod_completion.blink"
          },
        },
      },
    },
    opts_extend = { 'sources.default' }
  }
}
