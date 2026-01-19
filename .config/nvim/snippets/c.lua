local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

-- Helper: get filename in uppercase, replacing dots with underscores
local function guard_name()
  return "__" .. vim.fn.expand("%:t"):upper():gsub("%.", "_") .. "__"
end

return {
  s("guard", {
    t("#ifndef "), f(guard_name, {}),
    t({ "", "#define " }), f(guard_name, {}),
    t({ "", "", "" }), i(0),
    t({ "", "", "#endif /* " }), f(guard_name, {}), t(" */"),
  }),
}
