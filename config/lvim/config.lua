-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
vim.opt.cmdheight = 2             -- more space in the neovim command line for displaying messages
vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.opt.shiftwidth = 4            -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2               -- insert 2 spaces for a tab
vim.opt.relativenumber = true     -- relative line numbers
vim.opt.wrap = true               -- wrap lines

-- git blame related
vim.g.gitblame_message_template = '<author> • <summary> • <date>'
vim.g.gitblame_delay = 1000
vim.g.gitblame_date_format = "%b"

-- telescope
require("user.telescope")

-- dashboard
require("user.dashboard")

-- neotree
lvim.builtin.nvimtree.active = false -- NOTE: using neo-tree
require("user.neotree")

-- markdown preview
lvim.builtin.which_key.mappings["m"] = {
    "<cmd>MarkdownPreview<CR>", "Explorer"
}

-- lvim.colorscheme = "darcula"
lvim.colorscheme = "gruvbox-material"

lvim.format_on_save = true

lvim.plugins = {
    { "doums/darcula" },
    { "morhetz/gruvbox" },
    { "sainnhe/gruvbox-material" },
    { "f-person/git-blame.nvim" },
    { "tpope/vim-surround" },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    },
    {
        "iamcco/markdown-preview.nvim",
        config = function()
            vim.fn["mkdp#util#install"]()
        end,
    },
}
