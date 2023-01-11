local required = require('util.required')

required.under('configs')

vim.cmd('packadd vim-jetpack')
local plugins = {{ 'tani/vim-jetpack', opt = 1 }};
local pluginSettings = required.under('plugin-settings')
for _, exported in ipairs(pluginSettings) do
  for _, plugin in ipairs(exported) do
    table.insert(plugins, plugin)
  end
end
require('jetpack.packer').add(plugins)

required.under('commands')
