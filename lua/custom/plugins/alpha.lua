return {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    -- require('alpha').setup(require('alpha.themes.startify').config)
    -- require('alpha').setup(require('alpha.themes.dashboard').config)
    local config = require('alpha.themes.theta').config
    table.insert(config.layout, 3, {
      type = 'group',
      val = {
        {
          type = 'padding',
          val = 2,
        },
        {
          opts = {
            hl = 'SpecialComment',
            position = 'center',
            shrink_margin = false,
          },
          type = 'text',
          val = 'Quick Session',
        },
        {
          type = 'padding',
          val = 1,
        },
        {
          type = 'group',
          val = {
            {
              on_press = function()
                vim.cmd 'SessionManager load_current_dir_session'
              end,
              opts = {
                align_shortcut = 'right',
                cursor = 3,
                hl = { { 'DevIconTxt', 0, 4 } },
                hl_shortcut = 'Keyword',
                keymap = {
                  'n',
                  's',
                  '<cmd>SessionManager load_last_session<CR>',
                  {
                    noremap = true,
                    nowait = true,
                    silent = true,
                  },
                },
                position = 'center',
                shortcut = 's',
                width = 50,
              },
              type = 'button',
              val = '󰆓  Load This Folder',
            },
            {
              on_press = function()
                vim.cmd 'SessionManager load_last_session'
              end,
              opts = {
                align_shortcut = 'right',
                cursor = 3,
                hl = { { 'DevIconTxt', 0, 4 } },
                hl_shortcut = 'Keyword',
                keymap = {
                  'n',
                  's',
                  '<cmd>SessionManager load_last_session<CR>',
                  {
                    noremap = true,
                    nowait = true,
                    silent = true,
                  },
                },
                position = 'center',
                shortcut = 's',
                width = 50,
              },
              type = 'button',
              val = '󰆓  Load Last Session',
            },
            {
              on_press = function()
                vim.cmd 'SessionManager load_session'
              end,
              opts = {
                align_shortcut = 'right',
                cursor = 3,
                hl = { { 'DevIconLua', 0, 4 } },
                hl_shortcut = 'Keyword',
                keymap = {
                  'n',
                  'l',
                  '<cmd>SessionManager load_session<CR>',
                  {
                    noremap = true,
                    nowait = true,
                    silent = true,
                  },
                },
                position = 'center',
                shortcut = 'l',
                width = 50,
              },
              type = 'button',
              val = '󰍜  List Session',
            },
            {
              on_press = function()
                vim.cmd 'SessionManager delete_session'
              end,
              opts = {
                align_shortcut = 'right',
                cursor = 3,
                hl = { { 'DevIconJava', 0, 4 } },
                hl_shortcut = 'Keyword',
                keymap = {
                  'n',
                  'd',
                  '<cmd>SessionManager delete_session<CR>',
                  {
                    noremap = true,
                    nowait = true,
                    silent = true,
                  },
                },
                position = 'center',
                shortcut = 'd',
                width = 50,
              },
              type = 'button',
              val = '󰆴  Delete Session',
            },
          },
        },
      },
    })
    -- config.layout[4]
    require('alpha').setup(config)
  end,
}
