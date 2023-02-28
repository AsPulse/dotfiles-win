return {
  {
    'terrortylor/nvim-comment',
    event = 'BufEnter *.*',
    enabled = false,
    config = function()
      require('nvim_comment').setup()
    end
  }
}
