local required = require('util.required')

-- Load Configs
required.under('configs')

-- Install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup Plugins
vim.api.nvim_set_var('jetpack_copy_method', 'copy');
vim.cmd('packadd vim-jetpack')
local plugins = {{ 'tani/vim-jetpack', opt = 1 }};
local pluginSettings = required.under('plugin-settings')
for _, exported in ipairs(pluginSettings) do
  for _, plugin in ipairs(exported) do
    table.insert(plugins, plugin)
  end
end
require('jetpack.packer').add(plugins)


-- Load Commands
required.under('commands')

vim.g.isReload = true;
