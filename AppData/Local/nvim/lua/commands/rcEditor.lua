vim.api.nvim_create_user_command(
  'Editrc',
  'silent! cd $CHEZMOI | silent! Fern . -reveal=AppData/Local/nvim/init.vim',
  {}
)

vim.api.nvim_create_user_command(
  'Gorepo',
  function(opts)
    vim.api.nvim_command('silent! cd $GHDEV/' .. opts.fargs[1] .. ' | silent! Fern .')
  end,
  {
    nargs = 1,
    complete = function(arg_lead, _, _)
      local complete_list = {}
      local fd = vim.loop.fs_scandir(vim.env['GHDEV'])
      for name in function() return vim.loop.fs_scandir_next(fd) end do
        if vim.startswith(name, arg_lead) then
          table.insert(complete_list, name)
        end
      end
      return complete_list;
    end
  }
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
