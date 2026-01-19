return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300

    require("which-key").add({
      { "<leader>f", group = "Find" },
      { "<leader>u", group = "Options" },
      { "<leader>g", group = "Git" },
      { "<leader>b", group = "Buffers" },
    })
  end,
}
