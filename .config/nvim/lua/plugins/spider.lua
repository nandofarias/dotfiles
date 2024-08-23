return {
  "chrisgrieser/nvim-spider",
  keys = {
    { "w",  function() require('spider').motion('w') end,  desc = "Spider-w",  mode = { "n", "o", "x" } },
    { "e",  function() require('spider').motion('e') end,  desc = "Spider-e",  mode = { "n", "o", "x" } },
    { "b",  function() require('spider').motion('b') end,  desc = "Spider-b",  mode = { "n", "o", "x" } },
    { "ge", function() require('spider').motion('ge') end, desc = "Spider-ge", mode = { "n", "o", "x" } },
    { "w",  function() require('spider').motion('w') end,  mode = { "o" } },
    { "cw", "c<cmd>lua require('spider').motion('e')<CR>" },
    { "dw", "d<cmd>lua require('spider').motion('e')<CR>" },
  },
  lazy = true,
  config = true
}
