-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:
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

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      -- opts.section.header.val = {
      --   " █████  ███████ ████████ ██████   ██████",
      --   "██   ██ ██         ██    ██   ██ ██    ██",
      --   "███████ ███████    ██    ██████  ██    ██",
      --   "██   ██      ██    ██    ██   ██ ██    ██",
      --   "██   ██ ███████    ██    ██   ██  ██████",
      --   " ",
      --   "    ███    ██ ██    ██ ██ ███    ███",
      --   "    ████   ██ ██    ██ ██ ████  ████",
      --   "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
      --   "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
      --   "    ██   ████   ████   ██ ██      ██",
      -- }
      opts.section.header.val = custom_header()
      return opts
    end,
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },

  {
    "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure project root detection, check status with `:AstroRootInfo`
    rooter = {
      -- list of detectors in order of prevalence, elements can be:
      --   "lsp" : lsp detection
      --   string[] : a list of directory patterns to look for
      --   fun(bufnr: integer): string|string[] : a function that takes a buffer number and outputs detected roots
      detector = {
        "lsp", -- highest priority is getting workspace from running language servers
        { ".git", "_darcs", ".hg", ".bzr", ".svn" }, -- next check for a version controlled parent directory
        { "compile_commands.json", "MakeFile", "package.json" }, -- lastly check for known project root files
      },
      -- ignore things from root detection
      ignore = {
        servers = {}, -- list of language server names to ignore (Ex. { "efm" })
        dirs = {}, -- list of directory patterns (Ex. { "~/.cargo/*" })
      },
      -- automatically update working directory (update manually with `:AstroRoot`)
      autochdir = false,
      -- scope of working directory to change ("global"|"tab"|"win")
      scope = "global",
      -- show notification on every working directory change
      notify = false,
    },
  },
  },
}
