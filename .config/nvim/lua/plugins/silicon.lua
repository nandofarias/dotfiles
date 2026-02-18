return {
  'krivahtoo/silicon.nvim',
  build = './install.sh build',
  cmd = 'Silicon',
  keys = {
    { '<leader>ss', ":Silicon!<cr>", mode = 'v', desc = 'Screenshot a code snippet' },
    { '<leader>sc', ":Silicon<cr>",  mode = 'v', desc = 'Screenshot a code snippet into the clipboard' }
  },
  config = function()
    require('silicon').setup({
      font = 'Maple Mono NF',
      theme = 'tokyonight_moon',
      background = '#636da6',
      output = {
        path = vim.fn.expand("~/Pictures/Screenshots"),
        format = "silicon_[year][month][day]_[hour][minute][second].png",
      },
    })
  end
}
