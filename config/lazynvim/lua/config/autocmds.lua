-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.c", "*.cpp" },
  callback = function()
    require("conform").format({ async = false })
    -- local hunks = require("gitsigns").get_hunks()
    -- local format = require("conform").format
    -- for i = #hunks, 1, -1 do
    --   local hunk = hunks[i]
    --   if hunk ~= nil and hunk.type ~= "delete" then
    --     local start = hunk.added.start
    --     local last = start + hunk.added.count
    --     -- nvim_buf_get_lines uses zero-based indexing -> subtract from last
    --     local last_hunk_line = vim.api.nvim_buf_get_lines(0, last - 2, last - 1, true)[1]
    --     local range = { start = { start, 0 }, ["end"] = { last - 1, last_hunk_line:len() } }
    --     format({ range = range })
    --   end
    -- end
  end,
})
