return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" }, -- Load on these commands
  ft = { "markdown" }, -- Also load for markdown files
  build = function() -- Download the prebuilt preview binary on install/update
    require("lazy").load({ plugins = { "markdown-preview.nvim" } })
    vim.fn["mkdp#util#install"]()
  end,
  keys = {
    { "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", ft = "markdown", desc = "Markdown Preview Toggle" },
  },
  config = function()
    vim.g.mkdp_auto_close = 1 -- Close the browser tab when leaving the markdown buffer
    vim.g.mkdp_theme = "dark" -- Match a dark editor theme
  end,
}
