return {
  cmd = { "jdtls" },
  cmd_env = {
    JAVA_HOME = "/usr/lib/jvm/java-21-openjdk",
  },
  on_attact = function(_, bufnr)
    vim.keymap.set('n', '<leader>om', function()
      vim.lsp.buf.code_action({ context = { only = { "source.generate.method" } } })
    end, { buffer = bufnr, silent = true, desc = "Implement/Override Methods" })
  end,
}
