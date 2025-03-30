return {
  'Shatur/neovim-session-manager',
  config = function()
    local config = require 'session_manager.config'
    require('session_manager').setup {
      autoload_mode = config.AutoloadMode.Disabled, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
    }
  end,
  lazy = false,
  priority = 50,
  -- opts = {
  --   autoload_mode = config.AutoloadMode.Disabled, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
  -- },
}
