
function LeximaRulesReset()
  vim.fn['lexima#set_default_rules']()
  vim.fn['lexima#add_rule']({
     filetype = { 'typescript', 'typescriptreact' },
     priority = 2,
     char = '<cr>',
     delete = 1,
     at = [[css`\%#`]],
     input = '<cr>  ',
     input_after = '<cr>`;'
  })
  vim.fn['lexima#add_rule']({
     filetype = { 'typescriptreact', 'html' },
     priority = 2,
     char = '<cr>',
     at = [[<[a-zA-Z]*>\%#<\/[a-zA-Z]*>]],
     input = '<cr>',
     input_after = '<cr>'
  })
  vim.api.nvim_set_var('isLeximaLoaded', true);
end

local modules = {
  {
    'cohama/lexima.vim',
    config = LeximaRulesReset
  }
}

if vim.g.isLeximaLoaded == nil then
  vim.api.nvim_set_var('isLeximaLoaded', false)
end

if vim.api.nvim_get_var('isLeximaLoaded') then
  LeximaRulesReset()
  require('notify')('Lexima Rules Reloaded!', 'info', { timeout = 500, render = 'minimal', stages = 'fade' })
end

return modules
