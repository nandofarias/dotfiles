local vimp = require('vimp')
vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_custom_section = {
  a = { description = { '  Find File                 leader f f' }, command = 'Telescope find_files' },
  b = { description = { '  Find Word                 leader f g' }, command = 'Telescope live_grep' },
  c = { description = { '  Recents                   leader f h' }, command = 'Telescope oldfiles' },
  d = { description = { '  New File                  leader c n' }, command = 'DashboardNewFile' },
  f = { description = { '  Update Plugins            leader u  ' }, command = 'PackerSync' },
  g = { description = { '  Settings                  leader n v' }, command = 'edit $MYVIMRC' },
  h = { description = { '  Exit                      leader q q' }, command = 'exit' }
}
vim.g.dashboard_custom_header = {
  '                        ______________                 ',
  '                       /             /|                ',
  '                      /             / |                ',
  '                     /____________ /  |                ',
  '                    | ___________ |   |                ',
  '                    ||$ nvim █   ||   |                ',
  '                    ||           ||   |                ',
  '                    ||           ||   |                ',
  '                    ||___________||   |                ',
  '                    |   _______   |  /                 ',
  '                   /|  (_______)  | /                  ',
  '                  ( |_____________|/                   ',
  '                  \\                                   ',
  '               .=======================.               ',
  '               | ::::::::::::::::  ::: |               ',
  '               | ::::::::::::::[]  ::: |               ',
  '               |   -----------     ::: |               ',
  '               `-----------------------`               ',
  '                                                       ',
}
vimp.nnoremap('<silent> <Leader>fh', ':DashboardFindHistory<CR>')
vimp.nnoremap('<silent> <Leader>ff', ':DashboardFindFile<CR>')
vimp.nnoremap('<silent> <Leader>fg', ':DashboardFindWord<CR>')
vimp.nnoremap('<silent> <Leader>fb', ':DashboardJumpMark<CR>')
vimp.nnoremap('<silent> <Leader>cn', ':DashboardNewFile<CR>')
vim.cmd [[au VimEnter * hi! link DashboardShortcut DraculaGreen]]
