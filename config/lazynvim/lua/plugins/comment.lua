return {
  {
    "numToStr/Comment.nvim",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    keys = {
      {
        "<leader>/",
        function() require("Comment.api").toggle.linewise.current() end,
        desc = "Toggle comment",
        mode = "n",
      },
      {
        "<leader>/",
        function()
          local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
          vim.api.nvim_feedkeys(esc, "x", false)
          require("Comment.api").toggle.linewise(vim.fn.visualmode())
        end,
        desc = "Toggle comment (visual)",
        mode = "v",
      },
    },
    config = function()
      require("Comment").setup({
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      })
    end,
  },
}
