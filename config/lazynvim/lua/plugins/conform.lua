return {
    "stevearc/conform.nvim",
    opts = {
        formatters = {
            ["black"] = {
                command = "black",
                args = { "-q", "--stdin-filename", "$FILENAME", "-" },
                stdin = true,
                cwd = require("conform.util").root_file({
                    ".git",
                    "pyproject.toml",
                    "setup.py",
                }),
            },
        },
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "black" },
            rust = { "rustfmt" },
            html = { "prettier" },
            c = { "clang_format" },
            cpp = { "clang_format" },
            cuda = { "clang_format" },
            cmake = { "cmake_format" },
        },
    },
}
