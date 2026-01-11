require('dashboard').setup {
    theme = 'doom',
    config = {
      header = {
        '',
        '',
        '█▀▄▀█ ▄███▄     ▄▄▄▄▀ ▄███▄   ████▄ █▄▄▄▄ ',
        '█ █ █ █▀   ▀ ▀▀▀ █    █▀   ▀  █   █ █  ▄▀ ',
        '█ ▄ █ ██▄▄       █    ██▄▄    █   █ █▀▀▌  ',
        '█   █ █▄   ▄▀   █     █▄   ▄▀ ▀████ █  █  ',
        '   █  ▀███▀    ▀      ▀███▀           █   ',
        ' ▀                                  ▀     ',
        '',
        '',
      },
      center = {
        {
          icon = '  ',
          icon_hl = 'New',
          desc = 'New File',
          desc_hl = 'String',
          action = 'e newfile'
        },
        {
          icon = '  ',
          icon_hl = 'Recent',
          desc = 'Recents',
          desc_hl = 'String',
          action = 'Telescope oldfiles'
        },
        {
          icon = '  ',
          icon_hl = 'Projects',
          desc = 'Projects',
          desc_hl = 'String',
          action = 'Telescope projects'
        },
        {
          icon = '  ',
          icon_hl = 'Find',
          desc = 'Find File',
          desc_hl = 'String',
          action = 'Telescope find_files cwd=.'
        },
        {
          icon = '  ',
          icon_hl = 'Theme',
          desc = 'Change Theme',
          desc_hl = 'String',
          action = 'Telescope theme_switcher'
        },
        {
          icon = '󰑓  ',
          icon_hl = 'Update',
          desc = 'Update Plugins',
          desc_hl = 'String',
          action = 'Lazy sync'
        },
        {
          icon = '󰈆  ',
          icon_hl = 'Exit',
          desc = 'Exit',
          desc_hl = 'String',
          action = 'exit'
        }
      },
    }
  }
