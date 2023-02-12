return {
  {
    'nvim-lua/plenary.nvim'
  }, {
    'vim-denops/denops.vim'
  }, {
    'MunifTanjim/nui.nvim'
  }, {
    'lewis6991/satellite.nvim',
    config = function ()
      require('satellite').setup()
    end
  }, {
    'wakatime/vim-wakatime'
  }, {
    'deris/vim-duzzle'
  }, {
    'rcarriga/nvim-notify',
    config = function()
      require('notify').setup {
        background_colour = '#1E1E2E'
      }
    end
  }, {
    'dstein64/vim-startuptime'
  }, {
    'Allianaab2m/vimskey',
    requires = { 'vim-denops/denops.vim' }
  }
}
