local export = {}

function export.load(path)
  package.loaded[path] = nil
  return require(path)
end

function export.under(path)
  results = {}
  local fd = vim.loop.fs_scandir(vim.fn.stdpath('config') .. '/lua/' .. path)
  for name in function() return vim.loop.fs_scandir_next(fd) end do
    table.insert(results, export.load(path .. '.' .. name:gsub('.lua\z', '')))
  end
  return results
end


return export
