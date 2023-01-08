vim.fn['lexima#add_rule']({
   filetype = { 'typescript', 'typescriptreact' },
   priority = 2,
   char = '<cr>',
   delete = 1,
   at = 'css`%#`',
   input = '<cr>  ',
   input_after = '<cr>`;'
})
