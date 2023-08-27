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
-- require('telescope.builtin').grep_string({vim.fn.expand("%:p")})
lvim.builtin.which_key.mappings["ss"] = {
    function()
        require("telescope/builtin").current_buffer_fuzzy_find()
    end,
    "search current file",
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

-- dashboard
-- local function banner()
--     local banner1 = {
--         [[       QQQQQQQQQ       iiii                  hhhhhhh                                                   iiii  ]],
--         [[     QQ:::::::::QQ    i::::i                 h:::::h                                                  i::::i ]],
--         [[   QQ:::::::::::::QQ   iiii                  h:::::h                                                   iiii  ]],
--         [[  Q:::::::QQQ:::::::Q                        h:::::h                                                         ]],
--         [[  Q::::::O   Q::::::Qiiiiiii     ssssssssss   h::::h hhhhh       uuuuuu    uuuuuu    aaaaaaaaaaaaa   iiiiiii ]],
--         [[  Q:::::O     Q:::::Qi:::::i   ss::::::::::s  h::::hh:::::hhh    u::::u    u::::u    a::::::::::::a  i:::::i ]],
--         [[  Q:::::O     Q:::::Q i::::i ss:::::::::::::s h::::::::::::::hh  u::::u    u::::u    aaaaaaaaa:::::a  i::::i ]],
--         [[  Q:::::O     Q:::::Q i::::i s::::::ssss:::::sh:::::::hhh::::::h u::::u    u::::u             a::::a  i::::i ]],
--         [[  Q:::::O     Q:::::Q i::::i  s:::::s  ssssss h::::::h   h::::::hu::::u    u::::u      aaaaaaa:::::a  i::::i ]],
--         [[  Q:::::O     Q:::::Q i::::i    s::::::s      h:::::h     h:::::hu::::u    u::::u    aa::::::::::::a  i::::i ]],
--         [[  Q:::::O  QQQQ:::::Q i::::i       s::::::s   h:::::h     h:::::hu::::u    u::::u   a::::aaaa::::::a  i::::i ]],
--         [[  Q::::::O Q::::::::Q i::::i ssssss   s:::::s h:::::h     h:::::hu:::::uuuu:::::u  a::::a    a:::::a  i::::i ]],
--         [[  Q:::::::QQ::::::::Qi::::::is:::::ssss::::::sh:::::h     h:::::hu:::::::::::::::uua::::a    a:::::a i::::::i]],
--         [[   QQ::::::::::::::Q i::::::is::::::::::::::s h:::::h     h:::::h u:::::::::::::::ua:::::aaaa::::::a i::::::i]],
--         [[     QQ:::::::::::Q  i::::::i s:::::::::::ss  h:::::h     h:::::h  uu::::::::uu:::u a::::::::::aa:::ai::::::i]],
--         [[       QQQQQQQQ::::QQiiiiiiii  sssssssssss    hhhhhhh     hhhhhhh    uuuuuuuu  uuuu  aaaaaaaaaa  aaaaiiiiiiii]],
--         [[               Q:::::Q                                                                                       ]],
--         [[                QQQQQQ                                                                                       ]],
--     }
--     local banner2 = {
--         [[ test ]],
--     }

--     local alpha_wins = vim.tbl_filter(function(win)
--         local buf = vim.api.nvim_win_get_buf(win)
--         return vim.api.nvim_buf_get_option(buf, "filetype") == "alpha"
--     end, vim.api.nvim_list_wins())

--     if vim.api.nvim_win_get_height(alpha_wins[#alpha_wins]) < 36 then
--         return banner1
--     end
--     return banner2
-- end
lvim.builtin.alpha.dashboard.section.header.val = {
    [[       QQQQQQQQQ       iiii                  hhhhhhh                                                   iiii  ]],
    [[     QQ:::::::::QQ    i::::i                 h:::::h                                                  i::::i ]],
    [[   QQ:::::::::::::QQ   iiii                  h:::::h                                                   iiii  ]],
    [[  Q:::::::QQQ:::::::Q                        h:::::h                                                         ]],
    [[  Q::::::O   Q::::::Qiiiiiii     ssssssssss   h::::h hhhhh       uuuuuu    uuuuuu    aaaaaaaaaaaaa   iiiiiii ]],
    [[  Q:::::O     Q:::::Qi:::::i   ss::::::::::s  h::::hh:::::hhh    u::::u    u::::u    a::::::::::::a  i:::::i ]],
    [[  Q:::::O     Q:::::Q i::::i ss:::::::::::::s h::::::::::::::hh  u::::u    u::::u    aaaaaaaaa:::::a  i::::i ]],
    [[  Q:::::O     Q:::::Q i::::i s::::::ssss:::::sh:::::::hhh::::::h u::::u    u::::u             a::::a  i::::i ]],
    [[  Q:::::O     Q:::::Q i::::i  s:::::s  ssssss h::::::h   h::::::hu::::u    u::::u      aaaaaaa:::::a  i::::i ]],
    [[  Q:::::O     Q:::::Q i::::i    s::::::s      h:::::h     h:::::hu::::u    u::::u    aa::::::::::::a  i::::i ]],
    [[  Q:::::O  QQQQ:::::Q i::::i       s::::::s   h:::::h     h:::::hu::::u    u::::u   a::::aaaa::::::a  i::::i ]],
    [[  Q::::::O Q::::::::Q i::::i ssssss   s:::::s h:::::h     h:::::hu:::::uuuu:::::u  a::::a    a:::::a  i::::i ]],
    [[  Q:::::::QQ::::::::Qi::::::is:::::ssss::::::sh:::::h     h:::::hu:::::::::::::::uua::::a    a:::::a i::::::i]],
    [[   QQ::::::::::::::Q i::::::is::::::::::::::s h:::::h     h:::::h u:::::::::::::::ua:::::aaaa::::::a i::::::i]],
    [[     QQ:::::::::::Q  i::::::i s:::::::::::ss  h:::::h     h:::::h  uu::::::::uu:::u a::::::::::aa:::ai::::::i]],
    [[       QQQQQQQQ::::QQiiiiiiii  sssssssssss    hhhhhhh     hhhhhhh    uuuuuuuu  uuuu  aaaaaaaaaa  aaaaiiiiiiii]],
    [[               Q:::::Q                                                                                       ]],
    [[                QQQQQQ                                                                                       ]],
}
-- lvim.builtin.alpha.dashboard.section.header.val = {
--     [[       ██████     ███          █████                            ███  ]],
--     [[     ███░░░░███  ░░░          ░░███                            ░░░   ]],
--     [[    ███    ░░███ ████   █████  ░███████   █████ ████  ██████   ████  ]],
--     [[   ░███     ░███░░███  ███░░   ░███░░███ ░░███ ░███  ░░░░░███ ░░███  ]],
--     [[   ░███   ██░███ ░███ ░░█████  ░███ ░███  ░███ ░███   ███████  ░███  ]],
--     [[   ░░███ ░░████  ░███  ░░░░███ ░███ ░███  ░███ ░███  ███░░███  ░███  ]],
--     [[    ░░░██████░██ █████ ██████  ████ █████ ░░████████░░████████ █████ ]],
--     [[      ░░░░░░ ░░ ░░░░░ ░░░░░░  ░░░░ ░░░░░   ░░░░░░░░  ░░░░░░░░ ░░░░░  ]],
-- }
lvim.builtin.alpha.dashboard.section.footer.val = "天下事有难易乎"

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
    },
    current_buffer_fuzzy_find = {
        layout_config = {
            width = 0.95,
            height = 0.95,
            preview_width = 0.6,
        },
    },
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
}
