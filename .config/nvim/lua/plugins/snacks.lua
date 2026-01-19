return {
  "folke/snacks.nvim",
  priority = 10000,
  lazy = false,
  --- @type snacks.Config
  opts = {
    notifier = { enabled = true },
    bigfile = { enabled = true },
    input = { enabled = true },
    image = { enabled = true },
    indent = { enabled = true },
  },
  keys = {
    { "<leader>.",  function() Snacks.scratch() end,               desc = "Toggle Scratch Buffer" },
    { "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
    { "<leader>un", function() Snacks.notifier.hide() end,         desc = "Dismiss All Notifications" },
    { "<leader>bd", function() Snacks.bufdelete() end,             desc = "Delete Buffer" },
    { "<leader>cR", function() Snacks.rename.rename_file() end,    desc = "Rename File" },
    { "<leader>gB", function() Snacks.gitbrowse() end,             desc = "Git Browse",                  mode = { "n", "v" } },
    { "<leader>gb", function() Snacks.git.blame_line() end,        desc = "Git Blame Line" },
    { "<leader>gf", function() Snacks.lazygit.log_file() end,      desc = "Lazygit Current File History" },
    { "<leader>gg", function() Snacks.lazygit() end,               desc = "Lazygit" },
    { "<leader>gl", function() Snacks.lazygit.log() end,           desc = "Lazygit Log (cwd)" },
    { "<c-/>",      function() Snacks.terminal() end,              desc = "Toggle Terminal" },
    {
      "<leader>N",
      desc = "Neovim News",
      function()
        Snacks.win({
          file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
          width = 0.6,
          height = 0.6,
          wo = {
            spell = false,
            wrap = false,
            signcolumn = "yes",
            statuscolumn = " ",
            conceallevel = 3,
          },
        })
      end,
    }
  },
}
