-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map("n", "<leader>/", "<Plug>(comment_toggle_linewise_current)", { desc = "Toggle comment" })

map("x", "<leader>/", "<Plug>(comment_toggle_linewise_visual)", { desc = "Toggle comment" })
