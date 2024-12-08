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
  if vim.api.nvim_win_get_height(0) < 36 then
    return banner2
  else
    return banner1
  end
  return banner1
end
return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        enabled = { false },
      },
    },
  },

  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    enabled = true,
    init = false,
    opts = function()
      local dashboard = require("alpha.themes.dashboard")
      local logo = [[
         QQQQQQQQQ       iiii                  hhhhhhh                                                   iiii  
       QQ:::::::::QQ    i::::i                 h:::::h                                                  i::::i 
     QQ:::::::::::::QQ   iiii                  h:::::h                                                   iiii  
    Q:::::::QQQ:::::::Q                        h:::::h                                                         
    Q::::::O   Q::::::Qiiiiiii     ssssssssss   h::::h hhhhh       uuuuuu    uuuuuu    aaaaaaaaaaaaa   iiiiiii 
    Q:::::O     Q:::::Qi:::::i   ss::::::::::s  h::::hh:::::hhh    u::::u    u::::u    a::::::::::::a  i:::::i 
    Q:::::O     Q:::::Q i::::i ss:::::::::::::s h::::::::::::::hh  u::::u    u::::u    aaaaaaaaa:::::a  i::::i 
    Q:::::O     Q:::::Q i::::i s::::::ssss:::::sh:::::::hhh::::::h u::::u    u::::u             a::::a  i::::i 
    Q:::::O     Q:::::Q i::::i  s:::::s  ssssss h::::::h   h::::::hu::::u    u::::u      aaaaaaa:::::a  i::::i 
    Q:::::O     Q:::::Q i::::i    s::::::s      h:::::h     h:::::hu::::u    u::::u    aa::::::::::::a  i::::i 
    Q:::::O  QQQQ:::::Q i::::i       s::::::s   h:::::h     h:::::hu::::u    u::::u   a::::aaaa::::::a  i::::i 
    Q::::::O Q::::::::Q i::::i ssssss   s:::::s h:::::h     h:::::hu:::::uuuu:::::u  a::::a    a:::::a  i::::i 
    Q:::::::QQ::::::::Qi::::::is:::::ssss::::::sh:::::h     h:::::hu:::::::::::::::uua::::a    a:::::a i::::::i
     QQ::::::::::::::Q i::::::is::::::::::::::s h:::::h     h:::::h u:::::::::::::::ua:::::aaaa::::::a i::::::i
       QQ:::::::::::Q  i::::::i s:::::::::::ss  h:::::h     h:::::h  uu::::::::uu:::u a::::::::::aa:::ai::::::i
         QQQQQQQQ::::QQiiiiiiii  sssssssssss    hhhhhhh     hhhhhhh    uuuuuuuu  uuuu  aaaaaaaaaa  aaaaiiiiiiii
                 Q:::::Q                                                                                       
                  QQQQQQ                                                                                       
    ]]

      dashboard.section.header.val = vim.split(logo, "\n")
    -- stylua: ignore
    dashboard.section.buttons.val = {
      dashboard.button("f", " " .. " Find file",       "<cmd> lua LazyVim.pick()() <cr>"),
      dashboard.button("n", " " .. " New file",        [[<cmd> ene <BAR> startinsert <cr>]]),
      dashboard.button("r", " " .. " Recent files",    [[<cmd> lua LazyVim.pick("oldfiles")() <cr>]]),
      dashboard.button("g", " " .. " Find text",       [[<cmd> lua LazyVim.pick("live_grep")() <cr>]]),
      dashboard.button("c", " " .. " Config",          "<cmd> lua LazyVim.pick.config_files()() <cr>"),
      dashboard.button("s", " " .. " Restore Session", [[<cmd> lua require("persistence").load() <cr>]]),
      dashboard.button("x", " " .. " Lazy Extras",     "<cmd> LazyExtras <cr>"),
      dashboard.button("l", "󰒲 " .. " Lazy",            "<cmd> Lazy <cr>"),
      dashboard.button("q", " " .. " Quit",            "<cmd> qa <cr>"),
    }
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
      end
      dashboard.section.header.opts.hl = "AlphaHeader"
      dashboard.section.buttons.opts.hl = "AlphaButtons"
      dashboard.section.footer.opts.hl = "AlphaFooter"
      dashboard.opts.layout[1].val = 8
      return dashboard
    end,
    config = function(_, dashboard)
      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          once = true,
          pattern = "AlphaReady",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      require("alpha").setup(dashboard.opts)

      vim.api.nvim_create_autocmd("User", {
        once = true,
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          dashboard.section.footer.val = "YOLO!"
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
  },
}
