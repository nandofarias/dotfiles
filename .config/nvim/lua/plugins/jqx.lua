return {
    'gennaro-tedesco/nvim-jqx',
    ft = { 'json', 'yaml' },
    config = function()
      require("nvim-jqx.config").use_quickfix = false
    end,
    keys = {
        { '<leader>jk', ':JqxList<cr>',        desc = 'Populate the quickfix window with json keys' },
        { '<leader>jv', ':JqxList string<cr>', desc = 'Populate the quickfix window with string values' },
        { '<leader>jq', ':JqxQuery ',          desc = 'Executes a generic `jq` query in the current file' },
    }
}
