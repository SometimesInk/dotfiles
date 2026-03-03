return {
  cmd = { "vscode-json-language-server", "--stdio" },
  filetypes = { "json", },
  settings = {
    json = {
      format = {
        enable = true,
      },
    },
  },
}
