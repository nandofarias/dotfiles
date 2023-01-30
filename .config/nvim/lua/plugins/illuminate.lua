return {
  'RRethy/vim-illuminate',
  config = function()
    require('illuminate').configure({
      filetypes_denylist = {
        'dashboard',
        'NvimTree'
      }
    })
  end
}
