return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    'RRethy/nvim-treesitter-textsubjects',
    'windwp/nvim-ts-autotag',
    'JoosepAlviste/nvim-ts-context-commentstring',
    'IndianBoy42/tree-sitter-just',
  },
  config = function()
    require('tree-sitter-just').setup {}
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'bash', 'c', 'comment', 'css', 'csv', 'diff', 'dockerfile', 'eex', 'elixir', 'erlang',
        'fish', 'git_config', 'git_rebase', 'gitattributes', 'gitcommit', 'gitignore', 'gleam',
        'go', 'gomod', 'graphql', 'heex', 'html', 'http', 'hurl', 'javascript', 'jsdoc', 'json',
        'json5', 'jsonc', 'just', 'lua', 'make', 'markdown', 'markdown_inline', 'nix', 'query',
        'regex', 'ruby', 'rust', 'scss', 'sql', 'ssh_config', 'surface', 'terraform', 'toml',
        'tsx', 'typescript', 'vim', 'vimdoc', 'xml', 'yaml', 'zig',
      },
      indent = {
        enable = true,
        disable = function(_, buf)
          local max_filesize = 10 * 1024 -- 10 KB
          local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
      },
      highlight = {
        enable = true,
        use_languagetree = true,
        additional_vim_regex_highlighting = false,
      },
      autotag = {
        enable = true,
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["am"] = "@class.outer",
            ["im"] = "@class.inner",
            ["ac"] = "@comment.outer",
            ["as"] = "@statement.outer"
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = "@class.outer",
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]["] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[]"] = "@class.outer",
          },
        },
      },
      textsubjects = {
        enable = true,
        keymaps = {
          ['.'] = 'textsubjects-smart',
        }
      },
    })
  end
}
