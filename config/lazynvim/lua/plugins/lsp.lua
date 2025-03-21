-- require("lspconfig").clangd.setup({
--   on_attach = function(client, bufnr)
--     -- Disable LSP's formatting capability
--     client.server_capabilities.documentFormattingProvider = false
--     client.server_capabilities.documentRangeFormattingProvider = false
--   end,
-- })
return {
    "neovim/nvim-lspconfig",
    opts = {
        inlay_hints = { enabled = false },
        servers = {
            clangd = {
                on_attach = function(client, bufnr)
                    -- Disable LSP formatting to avoid conflicts with conform.nvim
                    client.server_capabilities.documentFormattingProvider = false
                    client.server_capabilities.documentRangeFormattingProvider = false
                end,
            },
        },
    },
}
