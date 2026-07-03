return {
  filetypes = { "html", "css" },
  cmd = { "emmet-language-server", "--stdio" },
  root_dir = vim.fs.dirname(vim.fs.find({ ".git" }, { upward = true })[1]),
}
