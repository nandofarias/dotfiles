local db = require('dashboard')
db.custom_center = {
  { icon = '   ', desc = 'Find File                      ', shortcut = 'leader f s', action = 'Telescope find_files' },
  { icon = '   ', desc = 'Find Word                      ', shortcut = 'leader f g', action = 'Telescope live_grep' },
  { icon = '   ', desc = 'Sessions                       ', shortcut = 'leader s t', action = 'Telescope persisted' },
  { icon = '   ', desc = 'New File                       ', shortcut = 'leader c n', action = 'DashboardNewFile' },
  { icon = '   ', desc = 'Update Plugins                 ', shortcut = 'leader u  ', action = 'PackerSync' },
  { icon = '   ', desc = 'Settings                       ', shortcut = 'leader n v', action = 'edit $MYVIMRC' },
  { icon = '   ', desc = 'Exit                           ', shortcut = 'leader q q', action = 'exit' }
}
db.custom_header = {
  '                                                       ',
  '                                                       ',
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
  '                                                       ',
  '                                                       ',
}
vim.cmd [[au VimEnter * hi! link DashboardHeader DraculaYellow]]
vim.cmd [[au VimEnter * hi! link DashboardCenter DraculaPurple]]
vim.cmd [[au VimEnter * hi! link DashboardCenterIcon DraculaCyan]]
vim.cmd [[au VimEnter * hi! link DashboardShortcut DraculaGreen]]
vim.cmd [[au VimEnter * hi! link DashboardFooter DraculaPurple]]
