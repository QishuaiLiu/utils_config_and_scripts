return {
  "stevearc/conform.nvim",
  opts = {
    log_level = vim.log.levels.DEBUG,
    formatter_by_ft = {
      lua = { "lua_ls" },
      python = { "black" },
      rust = { "rustfmt" },
      html = { "prettier" },
      c = { "clang_format" },
      cpp = { "clang_format" },
      cmake = { "cmake_format" },
    },

    formaters = {
      clang_format = {
        command = "clang_format",
        append_args = { "--style=file" },
      },
    },
  },
}
