return {
  {
    'nvim-lua/plenary.nvim'
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
    'rcarriga/nvim-notify'
  }, {
    'dstein64/vim-startuptime'
  }
}
