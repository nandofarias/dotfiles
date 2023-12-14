return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    'nvim-treesitter/playground',
    'RRethy/nvim-treesitter-textsubjects',
    'windwp/nvim-ts-autotag',
    'JoosepAlviste/nvim-ts-context-commentstring',
    'IndianBoy42/tree-sitter-just',
  },
  config = function()
    require "nvim-treesitter.install".compilers = { "gcc-11" }
    require('tree-sitter-just').setup {}
    require('nvim-treesitter.configs').setup({
      ensure_installed = { 'angular', 'arduino', 'astro', 'awk', 'bash', 'c', 'clojure', 'cmake', 'comment',
        'commonlisp', 'cpp', 'css', 'csv', 'dart', 'diff', 'dockerfile', 'dot', 'eex', 'elixir', 'elm', 'erlang',
        'fennel', 'fish', 'git_config', 'git_rebase', 'gitattributes', 'gitcommit', 'gitignore', 'gleam', 'go', 'gomod',
        'gosum', 'gowork', 'gpg', 'graphql', 'hack', 'haskell', 'hcl', 'heex', 'http', 'html', 'ini',
        'java', 'javascript', 'jsdoc', 'json', 'json5', 'jsonc', 'jsonnet', 'julia', 'kotlin', 'latex',
        'ledger', 'lua', 'make', 'markdown', 'markdown_inline', 'mermaid', 'nix', 'ocaml', 'ocaml_interface',
        'ocamllex', 'pascal', 'passwd', 'pem', 'perl', 'php', 'phpdoc', 'po', 'prisma', 'properties', 'proto', 'prql',
        'psv', 'pug', 'puppet', 'pymanifest', 'python', 'query', 'r', 'regex', 'requirements', 'robot', 'ruby', 'rust',
        'scala', 'scheme', 'scss', 'solidity', 'sparql', 'sql', 'ssh_config', 'supercollider', 'surface', 'svelte',
        'swift', 'terraform', 'tsv', 'tsx', 'typescript', 'vim', 'vimdoc', 'vue', 'xml', 'yaml', 'zig' },
      indent = {
        enable = true
      },
      highlight = {
        enable = true,
        use_languagetree = true,
        additional_vim_regex_highlighting = false,
      },
      autotag = {
        enable = true,
      },
      disable = function(lang, buf)
        local max_filesize = 10 * 1024 -- 10 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
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
