return {
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    dependencies = { 
      'marko-cerovac/material.nvim',
    },
    config = function ()
      require('lualine').setup {
        options = {
          theme = 'material-nvim',
        }
      }
    end
  }
}
