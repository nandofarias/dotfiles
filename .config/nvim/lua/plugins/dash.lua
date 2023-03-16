return {
  'mrjones2014/dash.nvim',
  build = 'make install',
  config = true,
  keys = {
    { '<space>sf', ':DashWord! <CR>', desc = "Dash" }
  }
}
