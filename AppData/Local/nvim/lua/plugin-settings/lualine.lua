return {
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    dependencies = {
      { 'marko-cerovac/material.nvim' },
      {
        'SmiteshP/nvim-gps',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
      }
    },
    config = function ()
      local gps = require('nvim-gps')
      gps.setup({})
      require('lualine').setup {
        sections = {
          lualine_c = {
            {
              function()
                local loc = gps.get_location()
                return (loc or '')
              end,
              condition = gps.is_available
            },
          }
        },
        options = {
          theme = 'material-nvim',
        }
      }
    end
  }
}
