vim.api.nvim_create_user_command(
  'Editrc',
  'silent! cd $CHEZMOI | silent! Fern . -reveal=AppData/Local/nvim/init.vim',
  {}
)

vim.api.nvim_create_user_command(
  'Reloadrc',
  function()
    vim.api.nvim_command('!chezmoi apply')
    vim.loop.new_timer():start(
      100, 0, vim.schedule_wrap(
        function()
          vim.api.nvim_command('luafile ' .. vim.env['NVIM'] .. '\\init.lua')
        end
      )
    )
  end,
  {}
)

return nil
