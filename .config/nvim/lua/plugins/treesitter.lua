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

require("nvim-treesitter.parsers").get_parser_configs().just = {
  install_info = {
    url = "https://github.com/IndianBoy42/tree-sitter-just",
    files = { "src/parser.c", "src/scanner.cc" },
    branch = "main",
    use_makefile = true,
  },
  maintainers = { "@IndianBoy42" },
}
