local _terminal_worker = nil
local _terminal_worker_cwd = nil

local _terminal_server = nil

local _terminal_lazygit = nil
local _terminal_lazygit_cwd = nil

local function _terminal_worker_open()
  if _terminal_worker == nil then
    _terminal_worker = require('toggleterm.terminal').Terminal:new({
      cmd = 'powershell',
      dir = vim.fn.getcwd(),
      direction = 'float',
      hidden = true,
      count = 2,
    })
    _terminal_worker_cwd = vim.fn.getcwd()
  end
  if _terminal_worker_cwd ~= vim.fn.getcwd() then
    _terminal_worker_cwd = vim.fn.getcwd()
    _terminal_worker:change_dir(_terminal_worker_cwd)
  end
  _terminal_worker:toggle()
end

local function _terminal_lazygit_open()
  if _terminal_lazygit ~= nil and _terminal_lazygit_cwd ~= vim.fn.getcwd() then
    _terminal_lazygit_cwd = vim.fn.getcwd()
    _terminal_lazygit:shutdown()
    _terminal_lazygit = nil
  end
  if _terminal_lazygit == nil then
    _terminal_lazygit = require('toggleterm.terminal').Terminal:new({
      cmd = 'lazygit',
      dir = vim.fn.getcwd(),
      direction = 'float',
      hidden = true,
      count = 1,
    })
    _terminal_lazygit_cwd = vim.fn.getcwd()
  end
  _terminal_lazygit:open()
end

local function _terminal_server_open()
  if _terminal_server == nil then
    _terminal_server = require('toggleterm.terminal').Terminal:new({
      cmd = 'powershell',
      dir = vim.fn.getcwd(),
      direction = 'float',
      hidden = true,
      count = 3,
      on_close = function()
        _terminal_server = nil
      end,
    })
  end
  _terminal_server:open()
end

local function _terminal_close()
  if _terminal_worker ~= nil then
    _terminal_worker:close()
  end
  if _terminal_lazygit ~= nil then
    _terminal_lazygit:close()
  end
  if _terminal_server ~= nil then
    _terminal_server:close()
  end
end

return {
  {
    'akinsho/toggleterm.nvim',
    lazy = true,
    init = function()
      local powershell_options = {
        shell = vim.fn.executable 'pwsh' == 1 and 'pwsh' or 'powershell',
        shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;',
        shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait',
        shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode',
        shellquote = '',
        shellxquote = '',
      }

      for option, value in pairs(powershell_options) do
        vim.opt[option] = value
      end
      vim.keymap.set('n', '<leader>git', _terminal_lazygit_open, { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>termw', _terminal_worker_open, { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>terms', _terminal_server_open, { noremap = true, silent = true })
      vim.keymap.set('t', '<leader>n', '<C-\\><C-n>', { noremap = true, silent = true })
      vim.keymap.set('t', '<leader>q', _terminal_close, { noremap = true, silent = true })
    end,
    config = function()
      require('toggleterm').setup({
        start_in_insert = true,
        persist_mode = false,
      })
    end,
  },
}

