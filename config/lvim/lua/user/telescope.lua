lvim.builtin.which_key.mappings["ss"] = {
    function()
        require("telescope/builtin").current_buffer_fuzzy_find()
    end,
    "search current file",
}
lvim.builtin.which_key.mappings["sw"] = {
    function()
        require("telescope/builtin").buffers()
    end,
    "search file in buffers",
}

lvim.builtin.which_key.mappings["lc"] = {
    "<cmd>Telescope lsp_document_symbols<CR>", "search file in buffers",
}

local builtin = require('telescope/builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = "find files." })
vim.keymap.set('n', '<C-s>', builtin.live_grep, { desc = "find words in whole project" })
-- vim.keymap.set('n', '<C-w>', builtin.grep_string, { desc = "search in current file" })

lvim.builtin.telescope.defaults.layout_strategy = "horizontal"
lvim.builtin.telescope.defaults.initial_mode = "insert"
lvim.builtin.telescope.defaults.layout_config.preview_cutoff = 120
lvim.builtin.telescope.defaults.layout_config.prompt_position = "bottom"
-- lvim.builtin.telescope.defaults.layout_config.width = 0.95
-- lvim.builtin.telescope.defaults.layout_config.height = 0.95

-- toggleTerm
lvim.builtin.terminal.open_mapping = "<C-\\>"
lvim.builtin.terminal.direction = "vertical"
lvim.builtin.terminal.size = 70


lvim.builtin.telescope.pickers = {
    find_files = {
        layout_config = {
            width = 0.95,
            height = 0.95,
            preview_width = 0.6,
        },
    },
    live_grep = {
        layout_config = {
            width = 0.95,
            height = 0.95,
            preview_width = 0.6,
        },
        only_sort_text = true,
    },
    current_buffer_fuzzy_find = {
        layout_config = {
            width = 0.95,
            height = 0.95,
            preview_width = 0.6,
        },
    },
}
