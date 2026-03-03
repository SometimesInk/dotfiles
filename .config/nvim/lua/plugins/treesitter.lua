return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      -- Force treesitter to install parsers in $HOME
      local install = require("nvim-treesitter.install")
      install.prefer_git = true
      install.compilers = { "gcc", "clang" }
    end,

    opts = {
      auto_install = true,
      sync_install = false,
      ignore_install = {},

      highlight = {
        enable = true,
        disable = { "latex" },
        additional_vim_regex_highlighting = false,
      },

      indent = { enable = true },
      folds = { enable = true },
      
      -- Parsers to install
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "css",
        "diff",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "latex",
        "lua",
        "luadoc",
        "luap",
        "make",
        "markdown",
        "markdown_inline",
        "norg",
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
      },
    },
  },
}

