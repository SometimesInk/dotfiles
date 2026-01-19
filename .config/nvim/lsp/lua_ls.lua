-- Called this file lua_lsp.lua instead of lua_ls.lua; just spent like 3 hours debugging this... :D

---@type vim.lsp.config
return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = {
    '.luarc.json',
    '.luarc.jsonc',
    '.luacheckrc',
    '.stylua.toml',
    'stylua.toml',
    'selene.toml',
    'selene.yml',
    '.git',
  }
}
