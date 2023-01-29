return {
  'mrjones2014/dash.nvim',
  build = 'make install',
  config = true,
  keys = {
    { '<space>df', ':DashWord! <CR>', desc = "Dash" }
  }
}
