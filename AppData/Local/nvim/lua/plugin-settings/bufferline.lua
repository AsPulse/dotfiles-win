return {
  {
    'akinsho/bufferline.nvim',
    version = 'v3.*',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'marko-cerovac/material.nvim'
    },
    config = function()
      require('bufferline').setup({})
    end
  }
}
