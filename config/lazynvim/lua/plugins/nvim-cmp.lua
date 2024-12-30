-- return {
--   "hrsh7th/nvim-cmp",
--   opt = function()
--     local cmp = require("cmp")
--     opts.mapping = cmp.mapping.preset.insert({
--       ["<Tab>"] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.insert}),
--     }),
--   end,
--   main = "lazyvim.util.cmp",
-- }
return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      -- Customize cmp sources
      opts.sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
        { name = "emoji" }, -- Add emoji completion
      }

      -- Add key mappings
      local cmp = require("cmp")
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        -- ["<C-l>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
      })

      return opts
    end,
  },
}
