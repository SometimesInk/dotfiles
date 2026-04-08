vim.lsp.enable("neocmake")
vim.lsp.enable("lua_ls")
vim.lsp.enable("clangd")
vim.lsp.enable("jdtls")
vim.lsp.enable("taplo")
vim.lsp.enable("pyright")
vim.lsp.enable("jsonls")
vim.lsp.enable("bashls")
vim.lsp.enable("html")
vim.lsp.enable("ts_ls")
vim.lsp.enable("yaml_ls")

-- Set keybinds when lsp attaches
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local opts = { noremap = true, buffer = ev.buf, silent = true }

    local k = vim.keymap.set

    k('n', 'K', vim.lsp.buf.hover, opts)
    k('n', 'F', vim.diagnostic.open_float, opts)
    k('n', 'R', vim.lsp.buf.rename, opts)

    k('n', 'gD', vim.lsp.buf.declaration, opts)
    k('n', 'gd', vim.lsp.buf.definition, opts)
    k('n', 'gri', vim.lsp.buf.implementation, opts)
    k('n', 'grr', vim.lsp.buf.references, opts)
    k('n', 'gra', vim.lsp.buf.code_action, opts)

    k('n', ']g', vim.diagnostic.goto_next, opts)
    k('n', '[g', vim.diagnostic.goto_prev, opts)
  end,
})
