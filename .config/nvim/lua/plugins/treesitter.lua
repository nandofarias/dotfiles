require('nvim-treesitter.configs').setup {
  ensure_installed = 'all',
  indent = {
    enable = true
  },
  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = { "markdown" },
  },
}
