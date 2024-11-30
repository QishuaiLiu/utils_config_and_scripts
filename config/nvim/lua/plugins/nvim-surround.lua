return {
  "kylechui/nvim-surround",
  version = "*",  -- Install the latest stable version
  event = "VeryLazy",  -- Load plugin lazily to improve startup time
  config = function()
    require("nvim-surround").setup({})
  end,
}
