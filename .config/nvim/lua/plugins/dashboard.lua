require('dashboard').setup({
  theme = 'doom',
  config = {
    header = {
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
    },
    center = {
      { icon = '   ', desc = 'Find File                      ', key = 's', action = 'Telescope find_files' },
      { icon = '   ', desc = 'Find Word                      ', key = 'g', action = 'Telescope live_grep' },
      { icon = '   ', desc = 'Sessions                       ', key = 't', action = 'Telescope persisted' },
      { icon = '   ', desc = 'New File                       ', key = 'n', action = 'DashboardNewFile' },
      { icon = '   ', desc = 'Update Plugins                 ', key = 'u', action = 'PackerSync' },
      { icon = '   ', desc = 'Settings                       ', key = 'o', action = 'edit $MYVIMRC' },
      { icon = '   ', desc = 'Exit                           ', key = 'q', action = 'exit' }
    },
    footer = {}
  },
})
