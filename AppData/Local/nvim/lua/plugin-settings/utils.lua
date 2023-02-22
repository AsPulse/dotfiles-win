return {
  {
    'deris/vim-duzzle',
    cmd = 'DuzzleStart'
  },
  {
    'kkharji/sqlite.lua',
    lazy = true
  },
  {
    'tyru/capture.vim',
    cmd = 'Capture'
  },
  {
    'jghauser/mkdir.nvim',
    event = { 'FileType fern', 'CmdlineEnter' }
  },
  {
    'editorconfig/editorconfig-vim',
    event = 'BufEnter *.*'
  },
  {
    'dstein64/vim-startuptime',
    cmd = 'StartupTime'
  }
}
