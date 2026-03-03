return {
  "lervag/vimtex",
  enabled = true,
  lazy = false, -- must be false for inverse search to work
  config = function()
    -- Vimtex settings
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_compiler_latexmk = {
      options = {
        "-shell-escape", -- needed for svg package
      },
      continuous = 1,
    }
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_quickfix_mode = 0
    vim.g.vimtex_quickfix_method = "latexlog"
    vim.g.vimtex_indent_enabled = 1
    vim.g.vimtex_mappings_disable = { ["n"] = { "K" } }


    -- Key mappings
    vim.api.nvim_set_keymap("n", "<leader>cB", ":VimtexView<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>cb", ":VimtexCompile<CR>", { noremap = true, silent = true })
  end,

  keys = {
    { "<localLeader>l", "", desc = "+vimtex", ft = "tex" },
  },
}
