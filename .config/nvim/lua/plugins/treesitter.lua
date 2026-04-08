local langs = {
  "editorconfig",
  "bash",
  "c",
  "cpp",
  "css",
  "diff",
  "html",
  "javascript",
  "jsdoc",
  "json",
  "latex",
  "lua",
  "luadoc",
  "luap",
  "make",
  "markdown",
  "markdown_inline",
  "printf",
  "python",
  "query",
  "regex",
  "scss",
  "svelte",
  "toml",
  "tsx",
  "typescript",
  "typst",
  "vim",
  "vimdoc",
  "vue",
  "xml",
  "yaml",
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,

    config = function(_, opts)
      local treesitter = require("nvim-treesitter")

      treesitter.install(langs)
    end,
  },
}
