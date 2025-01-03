-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd", "comile_commands.json" }
vim.opt.wrap = true
vim.g.format_enabled = false
vim.opt.jumpoptions = "stack"
