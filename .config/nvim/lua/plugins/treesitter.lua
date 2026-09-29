return {
  'arborist-ts/arborist.nvim',
  dependencies = {
    'windwp/nvim-ts-autotag',
    'JoosepAlviste/nvim-ts-context-commentstring',
    'andymass/vim-matchup',
  },
  config = function()
    require('arborist').setup({
      update_cadence = 'weekly',
      ensure_installed = {
        'bash', 'c', 'comment', 'css', 'csv', 'diff', 'dockerfile', 'eex', 'elixir', 'erlang',
        'fish', 'git_config', 'git_rebase', 'gitattributes', 'gitcommit', 'gitignore', 'gleam',
        'go', 'gomod', 'graphql', 'heex', 'html', 'http', 'hurl', 'javascript', 'jsdoc', 'json',
        'json5', 'jsonc', 'just', 'lua', 'make', 'markdown', 'markdown_inline', 'nix', 'query',
        'regex', 'ruby', 'rust', 'scss', 'sql', 'ssh_config', 'surface', 'terraform', 'toml',
        'tsx', 'typescript', 'vim', 'vimdoc', 'xml', 'yaml', 'zig',
      },
    })

    require('nvim-ts-autotag').setup({
      opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = false,
      },
    })

    require('ts_context_commentstring').setup({
      enable_autocmd = false,
    })

    vim.g.matchup_matchparen_offscreen = { method = 'popup' }
  end,
}
