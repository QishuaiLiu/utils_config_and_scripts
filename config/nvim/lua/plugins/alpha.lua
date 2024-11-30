
local banner1 = {
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
local banner2 = {
    [[       ██████     ███          █████                            ███  ]],
    [[     ███░░░░███  ░░░          ░░███                            ░░░   ]],
    [[    ███    ░░███ ████   █████  ░███████   █████ ████  ██████   ████  ]],
    [[   ░███     ░███░░███  ███░░   ░███░░███ ░░███ ░███  ░░░░░███ ░░███  ]],
    [[   ░███   ██░███ ░███ ░░█████  ░███ ░███  ░███ ░███   ███████  ░███  ]],
    [[   ░░███ ░░████  ░███  ░░░░███ ░███ ░███  ░███ ░███  ███░░███  ░███  ]],
    [[    ░░░██████░██ █████ ██████  ████ █████ ░░████████░░████████ █████ ]],
    [[      ░░░░░░ ░░ ░░░░░ ░░░░░░  ░░░░ ░░░░░   ░░░░░░░░  ░░░░░░░░ ░░░░░  ]],
}
-- return {
--   "goolord/alpha-nvim",
--   opts = function(plugins, opts)
--     opts.section.header.val = {
--     [[       QQQQQQQQQ       iiii                  hhhhhhh                                                   iiii  ]],
--     [[     QQ:::::::::QQ    i::::i                 h:::::h                                                  i::::i ]],
--     [[   QQ:::::::::::::QQ   iiii                  h:::::h                                                   iiii  ]],
--     [[  Q:::::::QQQ:::::::Q                        h:::::h                                                         ]],
--     [[  Q::::::O   Q::::::Qiiiiiii     ssssssssss   h::::h hhhhh       uuuuuu    uuuuuu    aaaaaaaaaaaaa   iiiiiii ]],
--     [[  Q:::::O     Q:::::Qi:::::i   ss::::::::::s  h::::hh:::::hhh    u::::u    u::::u    a::::::::::::a  i:::::i ]],
--     [[  Q:::::O     Q:::::Q i::::i ss:::::::::::::s h::::::::::::::hh  u::::u    u::::u    aaaaaaaaa:::::a  i::::i ]],
--     [[  Q:::::O     Q:::::Q i::::i s::::::ssss:::::sh:::::::hhh::::::h u::::u    u::::u             a::::a  i::::i ]],
--     [[  Q:::::O     Q:::::Q i::::i  s:::::s  ssssss h::::::h   h::::::hu::::u    u::::u      aaaaaaa:::::a  i::::i ]],
--     [[  Q:::::O     Q:::::Q i::::i    s::::::s      h:::::h     h:::::hu::::u    u::::u    aa::::::::::::a  i::::i ]],
--     [[  Q:::::O  QQQQ:::::Q i::::i       s::::::s   h:::::h     h:::::hu::::u    u::::u   a::::aaaa::::::a  i::::i ]],
--     [[  Q::::::O Q::::::::Q i::::i ssssss   s:::::s h:::::h     h:::::hu:::::uuuu:::::u  a::::a    a:::::a  i::::i ]],
--     [[  Q:::::::QQ::::::::Qi::::::is:::::ssss::::::sh:::::h     h:::::hu:::::::::::::::uua::::a    a:::::a i::::::i]],
--     [[   QQ::::::::::::::Q i::::::is::::::::::::::s h:::::h     h:::::h u:::::::::::::::ua:::::aaaa::::::a i::::::i]],
--     [[     QQ:::::::::::Q  i::::::i s:::::::::::ss  h:::::h     h:::::h  uu::::::::uu:::u a::::::::::aa:::ai::::::i]],
--     [[       QQQQQQQQ::::QQiiiiiiii  sssssssssss    hhhhhhh     hhhhhhh    uuuuuuuu  uuuu  aaaaaaaaaa  aaaaiiiiiiii]],
--     [[               Q:::::Q                                                                                       ]],
--     [[                QQQQQQ                                                                                       ]],
--     }
--     -- opts.section.footer.val = {
--     --         "",
--     --         "-- test",
--     --         "",
--     -- }
--   end,
-- }
local function custom_header()
    -- local alpha_wins = vim.tbl_filter(function(win)
    --     local buf = vim.api.nvim_win_get_buf(win)
    --     print(vim.api.nvim_buf_get_option(buf, "filetype"))
    --     return vim.api.nvim_buf_get_option(buf, "filetype") == "alpha"
    -- end, vim.api.nvim_list_wins())
    -- local alpha_wins = vim.tbl_filter(function(win)
    --     local buf = vim.api.nvim_win_get_buf(win)
    --     return vim.api.nvim_buf_get_option(buf, "filetype") == "alpha"
    -- end, vim.api.nvim_list_wins())
    --

    -- print(vim.api.nvim_win_get_height(0))
    --
    -- if #alpha_wins > 0 then
    --     local last_alpha_win_height = vim.api.nvim.height(alpha_wins[#alpha_wins])
    --     print("1111111")
    -- else
    --     print("2222222")
    -- end
    if vim.api.nvim_win_get_height(0) < 36 then
        return banner2
    else
        return banner1
    end
    return banner1
end
return {
    "goolord/alpha-nvim",
    opts = function(plugins, opts)
      opts.section.header.val = custom_header()
        -- local alpha_wins = vim.tbl_filter(function(win)
        --     local buf = vim.api.nvim_win_get_buf(win)
        --     return vim.api.nvim_buf_get_option(buf, "filetype") == "alpha"
        -- end, vim.api.nvim_list_wins())
        -- 
        -- if vim.api.nvim_win_get_height(alpha_wins[#alpha_wins]) < 36 then
        --     return banner2
        -- end
    end,
}

-- --
-- local alpha = require("alpha")
-- local dashboard = require("alpha.themes.dashboard")
--
-- dashboard.section.header.val = {
--     [[       QQQQQQQQQ       iiii                  hhhhhhh                                                   iiii  ]],
--     [[     QQ:::::::::QQ    i::::i                 h:::::h                                                  i::::i ]],
--     [[   QQ:::::::::::::QQ   iiii                  h:::::h                                                   iiii  ]],
--     [[  Q:::::::QQQ:::::::Q                        h:::::h                                                         ]],
--     [[  Q::::::O   Q::::::Qiiiiiii     ssssssssss   h::::h hhhhh       uuuuuu    uuuuuu    aaaaaaaaaaaaa   iiiiiii ]],
--     [[  Q:::::O     Q:::::Qi:::::i   ss::::::::::s  h::::hh:::::hhh    u::::u    u::::u    a::::::::::::a  i:::::i ]],
--     [[  Q:::::O     Q:::::Q i::::i ss:::::::::::::s h::::::::::::::hh  u::::u    u::::u    aaaaaaaaa:::::a  i::::i ]],
--     [[  Q:::::O     Q:::::Q i::::i s::::::ssss:::::sh:::::::hhh::::::h u::::u    u::::u             a::::a  i::::i ]],
--     [[  Q:::::O     Q:::::Q i::::i  s:::::s  ssssss h::::::h   h::::::hu::::u    u::::u      aaaaaaa:::::a  i::::i ]],
--     [[  Q:::::O     Q:::::Q i::::i    s::::::s      h:::::h     h:::::hu::::u    u::::u    aa::::::::::::a  i::::i ]],
--     [[  Q:::::O  QQQQ:::::Q i::::i       s::::::s   h:::::h     h:::::hu::::u    u::::u   a::::aaaa::::::a  i::::i ]],
--     [[  Q::::::O Q::::::::Q i::::i ssssss   s:::::s h:::::h     h:::::hu:::::uuuu:::::u  a::::a    a:::::a  i::::i ]],
--     [[  Q:::::::QQ::::::::Qi::::::is:::::ssss::::::sh:::::h     h:::::hu:::::::::::::::uua::::a    a:::::a i::::::i]],
--     [[   QQ::::::::::::::Q i::::::is::::::::::::::s h:::::h     h:::::h u:::::::::::::::ua:::::aaaa::::::a i::::::i]],
--     [[     QQ:::::::::::Q  i::::::i s:::::::::::ss  h:::::h     h:::::h  uu::::::::uu:::u a::::::::::aa:::ai::::::i]],
--     [[       QQQQQQQQ::::QQiiiiiiii  sssssssssss    hhhhhhh     hhhhhhh    uuuuuuuu  uuuu  aaaaaaaaaa  aaaaiiiiiiii]],
--     [[               Q:::::Q                                                                                       ]],
--     [[                QQQQQQ                                                                                       ]],
-- }
--
-- dashboard.section.footer.val = {
--     "",
--     "-- test",
--     "",
-- }
--
-- alpha.setup(dashboard.opts)
--
-- vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
