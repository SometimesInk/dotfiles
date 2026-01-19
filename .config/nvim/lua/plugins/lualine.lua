local function fmt_mode(mode)
  local map = {
    NORMAL = "ノーマル",
    INSERT = "インサート",
    VISUAL = "ビジュアル",
    ["V-LINE"] = "ビーライン",
    ["V-BLOCK"] = "ビーブロック",
    SELECT = "セレクト",
    ["S-LINE"] = "エスライン",
    ["S-BLOCK"] = "エスブロック",
    REPLACE = "リプレース",
    ["R-LINE"] = "アールライン",
    ["R-BLOCK"] = "アールブロック",
    COMMAND = "コマンド",
    TERMINAL = "ターミナル",
    OP_PENDING = "オーピーペンディング",
  }
  return map[mode] or mode
end

local level_kanji = {
  error = "錯誤",
  warn = "警告",
  info = "情報",
  hint = "示唆",
}

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    sections = {
      -- Left
      lualine_a = {
        {
          "mode",
          color = { gui = "bold" },
          fmt = fmt_mode,
        },
      },
      lualine_b = {
        "diff",
        {
          "diagnostics",
          sources = { "nvim_diagnostic", "nvim_lsp", "coc" },

          sections = { "error", "warn", "info", "hint" },
          symbols = {
            error = level_kanji.error,
            warn = level_kanji.warn,
            info = level_kanji.info,
            hint = level_kanji.hint,
          },
          colored = true,
          update_in_insert = false,
          always_visible = false,
        },
        {
          "lsp_status",
          symbols = {
            icons_enabled = false,
            spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
            done = "",
            separator = " ",
          },
          ignore_lsp = {},
        },
      },
      lualine_c = {
        {
          "filename",
          file_status = true,
          newfile_status = true,
          symbols = {
            modified = "", -- Text to show when the file is modified.
            readonly = "", -- Text to show when the file is non-modifiable or readonly.
            unnamed = "[Unnamed]", -- Text to show for unnamed buffers.
            newfile = "[New]", -- Text to show for newly created file before first write
          },
        },
      },

      -- Right
      lualine_x = {
        {
          "fileformat",
          symbols = {
            unix = "󰣇", -- e712
            dos = "", -- e70f
            mac = "", -- e711
          },
        },
      },
      lualine_y = { "location" },
      lualine_z = {
        {
          "datetime",
          -- options: default, us, uk, iso, or your own format string ("%H:%M", etc..)
          style = "%H時%M分%S秒",
          color = { gui = "bold" },
        },
      },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
    options = {
      icons_enabled = true,
      theme = "tokyonight-moon",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      always_show_tabline = true,
      globalstatus = false,
      refresh = {
        statusline = 100,
        tabline = 100,
        winbar = 100,
      },
    },
  },
}
