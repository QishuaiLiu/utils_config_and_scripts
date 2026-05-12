return {
  {
    "folke/ts-comments.nvim",
    enabled = false,
  },
  {
    "numToStr/Comment.nvim",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      local function has_placeholder(commentstring)
        return type(commentstring) == "string" and commentstring:find("%%s") ~= nil
      end

      local ts_context_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()

      require("Comment").setup({
        pre_hook = function(ctx)
          local ok, commentstring = pcall(ts_context_hook, ctx)
          if ok and has_placeholder(commentstring) then
            return commentstring
          end

          local ft_commentstring = require("Comment.ft").get(vim.bo.filetype, ctx.ctype)
          if has_placeholder(ft_commentstring) then
            return ft_commentstring
          end

          -- Returning even an empty buffer commentstring prevents Comment.nvim
          -- from taking its broken treesitter fallback path on Neovim 0.12-dev.
          return vim.bo.commentstring
        end,
      })
    end,
  },
}
