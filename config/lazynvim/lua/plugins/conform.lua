return {
  "stevearc/conform.nvim",
  opts = {
    log_level = vim.log.levels.DEBUG,
    formaters = {
      ["clang-format"] = {
        command = "clang-format",
        append_args = { "--style=file" },
      },
    },
    formatters_by_ft = {
      lua = { "lua_ls" },
      python = { "black" },
      rust = { "rustfmt" },
      html = { "prettier" },
      c = { "clang-format" },
      cpp = { "clang-format" },
      cmake = { "cmake-format" },
    },
  },
}

-- return { -- Autoformat
--     'stevearc/conform.nvim',
--     lazy = false,
--     keys = {
--       {
--         '<leader>f',
--         function()
--           require('conform').format { async = true, lsp_fallback = true }
--         end,
--         mode = '',
--         desc = '[F]ormat buffer',
--       },
--     },
--     opts = {
--       notify_on_error = true,
--       format_on_save = function(bufnr)
--         -- Disable "format_on_save lsp_fallback" for languages that don't
--         -- have a well standardized coding style. You can add additional
--         -- languages here or re-enable it for the disabled ones.
--         local disable_filetypes = { c = true, cpp = true }
--         return {
--           timeout_ms = 500,
--           lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
--         }
--       end,
--       formatters_by_ft = {
--         lua = { 'stylua' },
--         sh = { 'shfmt' },
--         html = { 'djlint' },
--         go = { 'gofmt', 'goimports' },
--         c = { 'clang_format' },
--         -- Conform can also run multiple formatters sequentially
--         -- python = { "isort", "black" },
--         --
--         -- You can use a sub-list to tell conform to run *until* a formatter
--         -- is found.
--         -- javascript = { { "prettierd", "prettier" } },
--       },
--       formatters = {
--         clang_format = {
--           prepend_args = { '--style=file', '--fallback-style=LLVM' },
--         },
--         shfmt = {
--           prepend_args = { '-i', '4' },
--         },
--       },
--     },
--   },
-- return {
--   {
--     "stevearc/conform.nvim",
--     dependencies = { "mason.nvim" },
--     lazy = true,
--     cmd = "ConformInfo",
--     keys = {
--       {
--         "<leader>fm",
--         function()
--           require("conform").format({ formatters = { "clang_format" }, timeout_ms = 3000 })
--         end,
--         mode = { "n", "v" },
--         desc = "Format Injected Langs",
--       },
--     },
--     init = function()
--       -- Install the conform formatter on VeryLazy
--       LazyVim.on_very_lazy(function()
--         LazyVim.format.register({
--           name = "conform.nvim",
--           priority = 100,
--           primary = true,
--           format = function(buf)
--             local opts = LazyVim.opts("conform.nvim")
--             require("conform").format(LazyVim.merge({}, opts.default_format_opts, { bufnr = buf }))
--           end,
--           sources = function(buf)
--             local ret = require("conform").list_formatters(buf)
--             ---@param v conform.FormatterInfo
--             return vim.tbl_map(function(v)
--               return v.name
--             end, ret)
--           end,
--         })
--       end)
--     end,
--     default_format_opts = {
--       -- LazyVim will use these options when formatting with the conform.nvim formatter
--       format = {
--         timeout_ms = 3000,
--         async = false, -- not recommended to change
--         quiet = false, -- not recommended to change
--         lsp_format = "fallback", -- not recommended to change
--       },
--       formatters_by_ft = {
--         lua = { "stylua" },
--         fish = { "fish_indent" },
--         sh = { "shfmt" },
--         cpp = { "clang_format" },
--         cmake = { "cmake_format" },
--       },
--
--       -- The options you set here will be merged with the builtin formatters.
--       -- You can also define any custom formatters here.
--       ---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
--       formatters = {
--         clang_format = {
--           prepend_args = { "--style=file:/home/myname/myproject1/.clang-format" },
--         },
--       },
--     },
--   },
-- }
