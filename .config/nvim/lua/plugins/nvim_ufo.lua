return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" },
  config = function()
    require("ufo").setup({
      provider_selector = function(bufnr, filetype, buftype)
        if filetype == "java" then
          return { "lsp", "marker" }
        end
        return { "treesitter", "indent" }
      end,
    })
  end,
}
