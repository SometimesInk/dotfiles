local ls = require("luasnip")
local s = ls.snippet
local f = ls.function_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node

-- Helper: get filename in uppercase, replacing dots with underscores
local function package_name()
  local filepath = vim.fn.expand("%:p")
  local root = vim.fn.getcwd()

  -- make path relative
  local rel = filepath:gsub(root .. "/", "")

  -- strip everything before src/main/java/
  rel = rel:gsub(".*src/main/java/", "")

  -- remove filename
  rel = rel:gsub("/[^/]+%.java$", "")

  -- convert path separators to dots
  local pkg = rel:gsub("/", ".")

  return pkg
end

return {
  s("cls", {
    f(function()
      local filename = vim.fn.expand("%:t:r");

      return "public class " .. filename .. " {"
    end),
    ls.text_node({ "", "", "" }),

    ls.text_node("\t"),
    i(0),

    ls.text_node({ "", "", "" }),
    ls.text_node("}"),
  }),
  s("ano", {
    f(function()
      local filename = vim.fn.expand("%:t:r");

      return "public @interface " .. filename .. " {"
    end),
    ls.text_node({ "", "", "" }),

    ls.text_node("\t"),
    i(0),

    ls.text_node({ "", "", "" }),
    ls.text_node("}"),
  }),
  s("pkg", {
    f(function()
      local pkg = package_name()
      if pkg ~= "" then
        return "package " .. pkg .. ";"
      else
        return "package ;"
      end
    end),
    ls.text_node({ "", "", "" }),
  }),
  s("fold", {
    isn(1, {
      t('// <editor-fold desc="'),
      i(1, "DESC"),
      t('">'),
      t({ "", "", "" }),
    }, "$PARENT_INDENT"),

    i(0),

    isn(nil, {
      t({ "", "", "" }),
      t('// </editor-fold>')
    }, "$PARENT_INDENT"),
  }),
}
