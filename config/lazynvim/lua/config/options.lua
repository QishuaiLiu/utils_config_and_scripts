-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd", "comile_commands.json" }
vim.opt.wrap = true
vim.g.format_enabled = false
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.jumpoptions = "stack"
vim.opt.mouse = 'a'
vim.opt.clipboard = "unnamedplus"
