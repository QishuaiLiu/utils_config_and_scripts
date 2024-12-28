-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map(
    "n",
    "<leader>/",
    '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>',
    { desc = "Toggle comment on current line" }
)

map(
    "x",
    "<leader>/",
    '<esc><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>',
    { desc = "Toggle comment on selection" }
)
