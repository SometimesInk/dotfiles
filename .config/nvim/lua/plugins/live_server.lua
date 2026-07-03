return {
  "https://git.barrettruth.com/barrettruth/live-server.nvim",
  opts = {
    port = 8080,
    browser = false,
  },
  keys = {
    { "<leader>ch", "<cmd>LiveServerStart<cr>", desc = "Start LiveServer" },
    { "<leader>cH", "<cmd>LiveServerStop<cr>",  desc = "Stop LiveServer" },
  }
}
