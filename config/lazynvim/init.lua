-- require("config.lazy")
local function is_large_file()
  local file = vim.fn.expand("%:p")
  if file == "" then return false end

  local max_size = 2 * 1024 * 1024 -- 2 MB
  local stat = vim.loop.fs_stat(file)
  return stat and stat.size > max_size
end

if not is_large_file() then
  require("config.lazy") -- Load LazyVim only for normal files
else
  vim.notify("Skipping LazyVim for large file", vim.log.levels.WARN)
end
