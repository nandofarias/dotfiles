require('octo').setup({
  default_remote = {'origin'},
})

local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
parser_config.markdown.filetype_to_parsername = 'octo'
