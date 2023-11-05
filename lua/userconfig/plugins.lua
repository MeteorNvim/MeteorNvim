local Plugins = {
  -- DiscordRPC
  {
   'MeteorNvim/presence.nvim',
    config = function ()
      require("userconfig.config.presence")
    end
  },

}

return Plugins
