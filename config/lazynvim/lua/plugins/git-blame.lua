return {
  "f-person/git-blame.nvim", -- Plugin repository
  event = "BufReadPre", -- Load plugin when a file is opened
  config = function()
    vim.g.gitblame_enabled = 1 -- Enable git-blame by default
    vim.g.gitblame_message_template = "<author> • <summary> • <date>"
    vim.g.gitblame_delay = 1000
    vim.g.gitblame_date_format = "%b"
  end,
}
