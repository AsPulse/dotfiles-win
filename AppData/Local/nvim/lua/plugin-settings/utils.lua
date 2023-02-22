return {
  {
    'deris/vim-duzzle',
    cmd = 'DuzzleStart'
  },
  {
    'kkharji/sqlite.lua',
    lazy = true,
    init = function ()
      vim.g.sqlite_clib_path = vim.fn.expand('$HOME') .. '/bin/sqlite3/sqlite3.dll'
    end
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
