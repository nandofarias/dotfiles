return {
  'krivahtoo/silicon.nvim',
  build = './install.sh build',
  keys = {
    { '<leader>ss', ":Silicon! ",   mode = 'v', desc = 'Screenshot a code snippet' },
    { '<leader>sc', ":Silicon<cr>", mode = 'v', desc = 'Screenshot a code snippet into the clipboard' }
  },
  config = function()
    require('silicon').setup({
      font = 'MonoLisa',
      theme = 'tokyonight_moon',
      background = '#636da6',
    })
  end
}
