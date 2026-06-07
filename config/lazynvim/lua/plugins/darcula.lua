-- if true then
--     return {}
-- end
return {
    {
        "Mofiqul/dracula.nvim",
        opts = {
            -- Let the terminal's transparency show through Neovim.
            transparent_bg = true,
        },
    },

    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "dracula",
        },
    },
    enabled = false,
}
